class CategoryModel {
  final String name;
  CategoryModel({required this.name});

  static final List<CategoryModel> categories = [
    CategoryModel(name: "Action"),
    CategoryModel(name: "Adventure"),
    CategoryModel(name: "Animation"),
    CategoryModel(name: "Biopic"),
    CategoryModel(name: "Comedy"),
    CategoryModel(name: "Romance"),
    CategoryModel(name: "Drama"),
    CategoryModel(name: "Horror"),
    CategoryModel(name: "Fantasy"),
    CategoryModel(name: "Documentary"),
    CategoryModel(name: "Mystery"),
  ];
}
