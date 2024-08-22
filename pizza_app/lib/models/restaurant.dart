import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_app/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'food.dart';
import 'package:provider/provider.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: 'Classic Cheese-Burger',
      description: 'A juicy beef patty with melted cheddar, fresh lettuce, ripe tomatoes, sliced onions, and pickles, served on a toasted bun.',
      imagePath: 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d',
      avialableAddons: [
        Addons(name: "Bacon", price: 1.50),
        Addons(name: "Avocado", price: 1.25),
        Addons(name: "Fried Egg", price: 1.00),
      ],
      price: 8.99,
      category: FoodCategory.Burgers,
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description: 'A smoky BBQ bacon burger with a beef patty, cheddar cheese, crispy bacon, and BBQ sauce.',
      imagePath: 'https://unsplash.com/photos/low-angle-of-burgers-FlmXvqlD-nI',
      avialableAddons: [
        Addons(name: "Onion Rings", price: 1.50),
        Addons(name: "Jalapenos", price: 0.75),
        Addons(name: "Extra BBQ Sauce", price: 0.50),
      ],
      price: 9.99,
      category: FoodCategory.Burgers,
    ),
    Food(
      name: 'Veggie Burger',
      description: 'A hearty veggie patty with lettuce, tomato, onions, and avocado slices, served on a whole-grain bun.',
      imagePath: 'https://unsplash.com/photos/a-stack-of-hamburgers-on-a-pink-background-wns2fRY-3PQ',
      avialableAddons: [
        Addons(name: "Grilled Mushrooms", price: 1.00),
        Addons(name: "Vegan Cheese", price: 1.50),
        Addons(name: "Spicy Mayo", price: 0.50),
      ],
      price: 7.99,
      category: FoodCategory.Burgers,
    ),
    Food(
      name: 'Aloha Burger',
      description: 'A tropical twist on a burger with a beef patty, grilled pineapple, ham, and sweet teriyaki sauce.',
      imagePath: 'https://unsplash.com/photos/person-holding-burger-with-lettuce-1bLxgAZ2P7w',
      avialableAddons: [
        Addons(name: "Extra Pineapple", price: 0.75),
        Addons(name: "Sweet Chili Sauce", price: 0.50),
        Addons(name: "Coconut Flakes", price: 0.50),
      ],
      price: 9.49,
      category: FoodCategory.Burgers,
    ),
    Food(
      name: 'Blue Moon Burger',
      description: 'A gourmet burger with blue cheese crumbles, caramelized onions, and arugula.',
      imagePath: 'https://unsplash.com/photos/a-person-holding-a-sandwich-in-their-hand-X5CytSjpnPM',
      avialableAddons: [
        Addons(name: "Extra Blue Cheese", price: 1.00),
        Addons(name: "Crispy Onions", price: 0.75),
        Addons(name: "Truffle Oil", price: 1.50),
      ],
      price: 10.99,
      category: FoodCategory.Burgers,
    ),

    // salads
    Food(
      name: 'Caesar Salad',
      description: 'Crisp romaine lettuce tossed with creamy Caesar dressing, croutons, and Parmesan cheese.',
      imagePath: 'https://unsplash.com/photos/person-holding-plate-of-sliced-tomato-and-green-vegetable-salad-_zXy4MvdWkA',
      avialableAddons: [
        Addons(name: "Grilled Chicken", price: 2.50),
        Addons(name: "Shrimp", price: 3.00),
        Addons(name: "Bacon Bits", price: 1.00),
      ],
      price: 7.99,
      category: FoodCategory.Salads,
    ),
    Food(
      name: 'Quinoa Salad',
      description: 'A nutritious salad with quinoa, cherry tomatoes, cucumber, red onion, and a lemon vinaigrette.',
      imagePath: 'https://unsplash.com/photos/a-bowl-of-food-kvp1Ppohv9I',
      avialableAddons: [
        Addons(name: "Feta Cheese", price: 1.50),
        Addons(name: "Olives", price: 0.75),
        Addons(name: "Sunflower Seeds", price: 0.50),
      ],
      price: 8.49,
      category: FoodCategory.Salads,
    ),
    Food(
      name: 'Asian Sesame Salad',
      description: 'A mix of greens, shredded carrots, and edamame, topped with a sesame ginger dressing.',
      imagePath: 'https://images.unsplash.com/photo-1601933471871-b219d60598cc',
      avialableAddons: [
        Addons(name: "Grilled Chicken", price: 2.50),
        Addons(name: "Tofu", price: 2.00),
        Addons(name: "Wonton Strips", price: 0.75),
      ],
      price: 8.99,
      category: FoodCategory.Salads,
    ),
    Food(
      name: 'Greek Salad',
      description: 'Fresh tomatoes, cucumber, red onion, olives, and feta cheese, dressed with olive oil and herbs.',
      imagePath: 'https://unsplash.com/photos/red-and-white-ceramic-figurine-juGdDUBPYec',
      avialableAddons: [
        Addons(name: "Grilled Chicken", price: 2.50),
        Addons(name: "Pita Bread", price: 1.00),
        Addons(name: "Extra Feta", price: 1.50),
      ],
      price: 7.99,
      category: FoodCategory.Salads,
    ),
    Food(
      name: 'Southwest Chicken Salad',
      description: 'Grilled chicken, black beans, corn, avocado, and tortilla strips over a bed of greens, with a zesty lime dressing.',
      imagePath: 'https://unsplash.com/photos/sliced-tomato-and-green-leaf-vegetable-on-white-ceramic-plate-YPO2u_TBSUY',
      avialableAddons: [
        Addons(name: "Extra Avocado", price: 1.25),
        Addons(name: "Cheddar Cheese", price: 1.00),
        Addons(name: "Jalapenos", price: 0.75),
      ],
      price: 9.49,
      category: FoodCategory.Salads,
    ),

    // sides
    Food(
      name: 'Sweet Potato Fries',
      description: 'Crispy, seasoned sweet potato fries served with a side of garlic aioli.',
      imagePath: 'https://images.unsplash.com/photo-1601933471871-b219d60598cc',
      avialableAddons: [
        Addons(name: "Cheese Sauce", price: 1.00),
        Addons(name: "Spicy Mayo", price: 0.75),
        Addons(name: "Ranch Dressing", price: 0.50),
      ],
      price: 4.99,
      category: FoodCategory.Sides,
    ),
    Food(
      name: 'Crispy Mac and Cheese Bites',
      description: 'Bite-sized mac and cheese, breaded and fried to golden perfection.',
      imagePath: 'https://unsplash.com/photos/a-piece-of-cake-next-to-an-apple-on-a-pink-surface-ny49YeH9Hms',
      avialableAddons: [
        Addons(name: "Marinara Sauce", price: 0.75),
        Addons(name: "Truffle Oil", price: 1.50),
        Addons(name: "Extra Cheese", price: 1.00),
      ],
      price: 5.99,
      category: FoodCategory.Sides,
    ),
    Food(
      name: 'Loaded Sweet Potato Fries',
      description: 'Sweet potato fries topped with cheese, bacon bits, and green onions.',
      imagePath: 'https://unsplash.com/photos/a-close-up-of-a-pile-of-fried-food-LfDApJ4kXfk',
      avialableAddons: [
        Addons(name: "Sour Cream", price: 0.75),
        Addons(name: "Chili", price: 1.50),
        Addons(name: "Guacamole", price: 1.25),
      ],
      price: 6.49,
      category: FoodCategory.Sides,
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Sliced baguette topped with garlic butter and parsley, baked to a crisp.',
      imagePath: 'https://unsplash.com/photos/a-close-up-of-some-bread-in-a-pan-XS_LAN4cQ0k',
      avialableAddons: [
        Addons(name: "Cheese", price: 1.00),
        Addons(name: "Marinara Sauce", price: 0.75),
        Addons(name: "Pesto", price: 1.25),
      ],
      price: 3.99,
      category: FoodCategory.Sides,
    ),
    Food(
      name: 'Onion Rings',
      description: 'Thick-cut onion rings, battered and fried to a golden brown, served with a side of chipotle mayo.',
      imagePath: 'https://unsplash.com/photos/a-red-plate-topped-with-onion-rings-next-to-a-basket-of-fries-m9CP4N80Zes',
      avialableAddons: [
        Addons(name: "BBQ Sauce", price: 0.50),
        Addons(name: "Ranch Dressing", price: 0.50),
        Addons(name: "Chipotle Mayo", price: 0.75),
      ],
      price: 4.49,
      category: FoodCategory.Sides,
    ),
    // drinks
    Food(
      name: 'Chocolate Lava Cake',
      description: 'A warm, rich chocolate cake with a molten center, served with vanilla ice cream.',
      imagePath: 'https://unsplash.com/photos/a-white-plate-topped-with-a-piece-of-cake-and-ice-cream-PFG4JCWomIM',
      avialableAddons: [
        Addons(name: "Extra Ice Cream", price: 1.00),
        Addons(name: "Whipped Cream", price: 0.75),
        Addons(name: "Caramel Drizzle", price: 0.50),
      ],
      price: 6.99,
      category: FoodCategory.Deserts,
    ),
    Food(
      name: 'New York Cheesecake',
      description: 'Classic creamy cheesecake with a graham cracker crust, served with a strawberry compote.',
      imagePath: 'https://unsplash.com/photos/cheesecake-with-pink-toppings-FDYbS43jUrU',
      avialableAddons: [
        Addons(name: "Extra Strawberries", price: 0.75),
        Addons(name: "Chocolate Sauce", price: 0.50),
        Addons(name: "Whipped Cream", price: 0.50),
      ],
      price: 5.99,
      category: FoodCategory.Deserts,
    ),
    Food(
      name: 'Tiramisu',
      description: 'Traditional Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cheese.',
      imagePath: 'https://unsplash.com/photos/a-piece-of-cake-sitting-on-top-of-a-white-plate-_Bs62oh7x5Q',
      avialableAddons: [
        Addons(name: "Extra Cocoa Powder", price: 0.25),
        Addons(name: "Extra Espresso", price: 0.50),
        Addons(name: "Cream Cheese Frosting", price: 0.75),
      ],
      price: 7.49,
      category: FoodCategory.Deserts,
    ),
    Food(
      name: 'Apple Pie',
      description: 'A slice of traditional apple pie served warm with a scoop of vanilla ice cream.',
      imagePath: 'https://unsplash.com/photos/brown-pie-on-white-ceramic-plate-lYOAaMPtEB8',
      avialableAddons: [
        Addons(name: "Extra Ice Cream", price: 1.00),
        Addons(name: "Caramel Sauce", price: 0.50),
        Addons(name: "Whipped Cream", price: 0.75),
      ],
      price: 4.99,
      category: FoodCategory.Deserts,
    ),
    Food(
      name: 'Brownie Sundae',
      description: 'Warm chocolate brownie topped with vanilla ice cream, chocolate sauce, and nuts.',
      imagePath: 'https://unsplash.com/photos/a-cupcake-under-a-glass-dome-on-a-table-K5AxMLo6vxk',
      avialableAddons: [
        Addons(name: "Extra Nuts", price: 0.50),
        Addons(name: "Maraschino Cherries", price: 0.25),
        Addons(name: "Caramel Sauce", price: 0.50),
      ],
      price: 5.49,
      category: FoodCategory.Deserts,
    ),
    Food(
      name: 'Fruit Tart',
      description: 'A buttery tart shell filled with vanilla custard and topped with fresh seasonal fruits.',
      imagePath: 'https://unsplash.com/photos/a-group-of-fruit-tarts-sitting-on-top-of-a-table-K8z5FJUay74',
      avialableAddons: [
        Addons(name: "Extra Fruit", price: 0.75),
        Addons(name: "Honey Drizzle", price: 0.50),
        Addons(name: "Mint Leaves", price: 0.25),
      ],
      price: 6.49,
      category: FoodCategory.Deserts,
    ),

    // deserts
    Food(
      name: 'Iced Coffee',
      description: 'A refreshing iced coffee made from freshly brewed espresso and milk, served with ice.',
      imagePath: 'https://unsplash.com/photos/clear-drinking-glass-with-beverage-8udS_wXiUZ4',
      avialableAddons: [
        Addons(name: "Extra Shot of Espresso", price: 1.00),
        Addons(name: "Almond Milk", price: 0.75),
        Addons(name: "Vanilla Syrup", price: 0.50),
      ],
      price: 3.99,
      category: FoodCategory.Drinks,
    ),
    Food(
      name: 'Lemonade',
      description: 'Freshly squeezed lemonade with a hint of mint, served over ice.',
      imagePath: 'https://unsplash.com/photos/sliced-lemon-beside-two-clear-drinking-glasses-_PaXoN4_2s0',
      avialableAddons: [
        Addons(name: "Extra Mint", price: 0.25),
        Addons(name: "Strawberry Syrup", price: 0.50),
        Addons(name: "Soda Water", price: 0.50),
      ],
      price: 2.99,
      category: FoodCategory.Drinks,
    ),
    Food(
      name: 'Mango Smoothie',
      description: 'Creamy mango smoothie made with fresh mangoes, yogurt, and a touch of honey.',
      imagePath: 'https://unsplash.com/photos/a-close-up-of-oranges-on-a-white-table-ufmEG5h07DA',
      avialableAddons: [
        Addons(name: "Chia Seeds", price: 0.50),
        Addons(name: "Coconut Flakes", price: 0.75),
        Addons(name: "Extra Mango", price: 1.00),
      ],
      price: 4.49,
      category: FoodCategory.Drinks,
    ),
    Food(
      name: 'Hot Chocolate',
      description: 'Rich hot chocolate made with real cocoa and topped with whipped cream.',
      imagePath: 'https://unsplash.com/photos/a-glass-of-beer-BpcTCHoruSo',
      avialableAddons: [
        Addons(name: "Extra Whipped Cream", price: 0.50),
        Addons(name: "Marshmallows", price: 0.75),
        Addons(name: "Cinnamon", price: 0.25),
      ],
      price: 3.49,
      category: FoodCategory.Drinks,
    ),
    Food(
      name: 'Green Tea Latte',
      description: 'A smooth and creamy green tea latte made with matcha and steamed milk.',
      imagePath: 'https://unsplash.com/photos/white-ceramic-teacup-filled-of-matcha-tea-Z-hvocTfR_s',
      avialableAddons: [
        Addons(name: "Honey", price: 0.50),
        Addons(name: "Almond Milk", price: 0.75),
        Addons(name: "Matcha Powder", price: 1.00),
      ],
      price: 4.99,
      category: FoodCategory.Drinks,
    ),
    Food(
      name: 'Fruit Punch',
      description: 'A tropical blend of orange, pineapple, and cranberry juices with a splash of soda.',
      imagePath: 'https://unsplash.com/photos/a-glass-filled-with-liquid-sitting-on-top-of-a-marble-slab-U3x7pwX9kAE',
      avialableAddons: [
        Addons(name: "Pineapple Chunks", price: 0.50),
        Addons(name: "Grenadine", price: 0.50),
        Addons(name: "Mint Leaves", price: 0.25),
      ],
      price: 3.49,
      category: FoodCategory.Drinks,
    ),
  ];

  /*
  GETTERS
   */

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;


/*
  OPERATIONS
   */
  // cart
  final List<CartItem> _cart = [];

// add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // see if there's a cart item available with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
          item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // if item already exits increment it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise add  a newcart item to the cart
    else {
      _cart.add(CartItem(selectedAddons: selectedAddons, food: food));
    }
    notifyListeners();
  }

// remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addons addons in cartItem.selectedAddons) {
        itemTotal += addons.price;
      }
      total = itemTotal * cartItem.quantity;
    }
    return total;
  }

// get total number of items in cart

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }


/*
  HELPER CLASS
   */
  // // estimated delivery time
  String displayEstimatedDeliveryTime() {
    final time = StringBuffer();
    time.write("Estimated Delivery Time:");
    time.writeln();

    // Calculate the delivery time by adding 120 minutes to the current time
    DateTime currentTime = DateTime.now();
    DateTime deliveryTime = currentTime.add(Duration(hours: 120));

    // Format the delivery time
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(deliveryTime);
    time.writeln(formattedDate);
    time.writeln();
    time.writeln(".........");

    return time.toString();
  }
// generate receipt
  String displayCartReciept() {
    final receipt = StringBuffer();
    receipt.write("Here's your Receipt.");
    receipt.writeln();

    // date formatter for current time
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(
        DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln(".........");

    for (final cartItem in cart) {
      receipt.writeln("${cartItem} x ${cartItem.food.name} - ${_formatPrice(
          cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("...........");
    receipt.writeln("");
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total items: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

// format double value into money
String _formatPrice(double price){
  return "\$${price.toStringAsFixed(2)}";
}

// format list of addons into a string summary
  String _formatAddons(List<Addons> addons){
    return addons
        .map((addons) => "${addons.name} (${_formatPrice((addons.price))})")
        .join(", ");
  }
}