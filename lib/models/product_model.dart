class ProductModel {
  final int id;
  final String title;
  dynamic price;
  final String descreption;
  final String image;
  final String category;
  final Rating rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.descreption,
      required this.image,
      required this.category,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        category: jsonData['category'],
        id: jsonData['id'],
        title: jsonData['title'],
        price: int.parse(jsonData['price']),
        descreption: jsonData['description'],
        image: jsonData['image'],
        rating: Rating.fromjson(jsonData['rating']));
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromjson(jsonData) {
    return Rating(rate: jsonData['rate'], count: jsonData['count']);
  }
}
