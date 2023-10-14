class Product {
  final int id;
  final String title;
  final String image;
  double rating;

  Product(
      {required this.id,
      required this.title,
      required this.rating,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        rating: json['rating'] as double);
  }
}
