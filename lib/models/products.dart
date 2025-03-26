class MyProductModel {
  final String image, name, category;
  final double price, rate, distance;

  MyProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.category,
    required this.distance,
  });
}

List<MyProductModel> myProductModel = [
  MyProductModel(
    image: 'assets/images/image/sapporo_miso_ramen.png',
    name: 'Sapporo Miso',
    price: 3.9,
    rate: 5,
    distance: 150,
    category: "Ramen",
  ),
  MyProductModel(
    image: 'assets/images/image/kurume_ramen.png',
    name: 'Kurume Ramen',
    price: 4.3,
    rate: 4.9,
    distance: 600,
    category: "Ramen",
  ),
  MyProductModel(
    image: 'assets/images/image/hakata_ramen.png',
    name: 'Hakata Ramen',
    price: 3.9,
    distance: 400,
    rate: 4.8,
    category: "Ramen",
  ),
  MyProductModel(
    image: 'assets/images/image/shrimp_fried_rice.png',
    name: 'Shrimp Fried Rice',
    price: 4.9,
    distance: 800,
    rate: 4.5,
    category: "Ramen",
  ),
  MyProductModel(
    image: 'assets/images/image/fullset_ramen.png',
    name: 'Fullset Ramen',
    price: 5.9,
    distance: 400,
    rate: 4.7,
    category: "Ramen",
  ),
  //for burger
  MyProductModel(
    image: 'assets/images/image/grilled-beef-burger.png',
    name: 'Grilled beef burger',
    price: 33.5,
    distance: 150,
    rate: 5.0,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/images/image/fried-chicken-burger.png',
    name: 'Fried Chicken Burger',
    price: 23.0,
    distance: 150,
    rate: 4.7,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/images/image/cheese-burger.png',
    name: 'Cheese Burger',
    price: 40.5,
    distance: 100,
    rate: 4.5,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/images/image/beef-burger.png',
    name: 'Beef-Burger',
    price: 18.5,
    distance: 200,
    rate: 5.0,
    category: "Burger",
  ),
  // for salad
  MyProductModel(
    image: 'assets/images/image/veg-salad.png',
    name: 'Veg Salad',
    price: 7.0,
    distance: 300,
    rate: 5.0,
    category: "Salad",
  ),
  MyProductModel(
    image: 'assets/images/image/mix-salad.png',
    name: 'Mix Salad',
    price: 10.0,
    distance: 350,
    rate: 4.8,
    category: "Salad",
  ),
  // for waffle
  MyProductModel(
    image: 'assets/images/image/berry-bonanza-waffle.png',
    name: 'Berry Bonanza Waffle',
    price: 10.0,
    distance: 500,
    rate: 4.5,
    category: "Waffle",
  ),
];
