class CategoryEduModel {
  final int id;
  final String nama_education;
  final String images;

  CategoryEduModel(
      {required this.id, required this.nama_education, required this.images});

  factory CategoryEduModel.fromJson(Map<String, dynamic> json) {
    return CategoryEduModel(
      id: json['id'] as int,
      nama_education: json['nama_education'] as String,
      images: json['images'] as String,
    );
  }
}