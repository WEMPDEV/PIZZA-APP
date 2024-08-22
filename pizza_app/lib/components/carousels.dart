import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

enum RestaurantCategory {
  Burgers,
  Salads,
  Sides,
  Deserts,
  Drinks,
}

class Carousel extends StatefulWidget {
  final Map<RestaurantCategory, String> imagePaths = {
    RestaurantCategory.Burgers: 'assets/hamburger.png',
    RestaurantCategory.Salads: 'assets/salads.jpg',
    RestaurantCategory.Sides: 'assets/sides.png',
    RestaurantCategory.Deserts: 'assets/pizzadesert.png',
    RestaurantCategory.Drinks: 'assets/drinks.jpg',
  };

  final Function(RestaurantCategory) onItemTapped;

  Carousel({required this.onItemTapped, required ScrollController scrollController});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: RestaurantCategory.values.length,
          itemBuilder: (context, index, realIndex) {
            final category = RestaurantCategory.values[index];
            final imagePath = widget.imagePaths[category] ?? 'assets/testimage.png';

            return GestureDetector(
              onTap: () => widget.onItemTapped(category),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) => setState(() {
              activeIndex = index;
            }),
          ),
        ),
        SizedBox(height: 16),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: RestaurantCategory.values.length,
    effect: ExpandingDotsEffect(
      dotWidth: 15,
      dotHeight: 10,
      activeDotColor: Colors.redAccent,
      dotColor: Colors.grey,
    ),
  );
}
