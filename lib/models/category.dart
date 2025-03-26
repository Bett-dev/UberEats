class CategoryModel {
  final String image, name;
  CategoryModel({required this.image, required this.name});
}

List<CategoryModel> myCategories = [
  CategoryModel(image: 'assets/images/image/ramen.png', name: 'Ramen'),
  CategoryModel(image: 'assets/images/image/burger.png', name: 'Burger'),
  CategoryModel(image: 'assets/images/image/salad.png', name: 'Salad'),
  CategoryModel(image: 'assets/images/image/pancake.png', name: 'Waffle'),
];
