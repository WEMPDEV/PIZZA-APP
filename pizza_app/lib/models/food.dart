class Food{
  final String name; // chese burger
  final String description; // burger full of chesse
  final String imagePath; // ib/assests
  final double price; // 5$
  final FoodCategory category; // burger
  List<Addons> avialableAddons;
  Food({
    required this.category,
   required this.name,
   required this.description,
   required this.imagePath,
   required this.price,
    required this.avialableAddons,
  });
}

// food category
enum FoodCategory{
  Burgers,
  Salads,
  Sides,
  Deserts,
  Drinks,
}
// food addons
class Addons{
  String name;
  double price;
  Addons({
    required this.name,
    required this.price,
  });
}