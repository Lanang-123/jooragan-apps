class Product {
  final int id;
  final String title;
  final String image;
  final String price;
  double rating;

  Product(
      {required this.id,
      required this.title,
      required this.rating,
      required this.price,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        price: json['price'] as String,
        rating: json['rating'] as double);
  }
}
