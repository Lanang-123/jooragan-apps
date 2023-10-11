class CategoryModel {
  final int id;
  final String nama_category;
  final String icon;

  CategoryModel(
      {required this.id, required this.nama_category, required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      nama_category: json['nama_category'] as String,
      icon: json['icon'] as String,
    );
  }
}
