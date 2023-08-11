class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  // final RatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating
  });

  factory ProductModel.fromjson(jsondata) {
    return ProductModel(
      id: jsondata["id"],
      title: jsondata['title'],
      price: jsondata['price'],
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      // rating: RatingModel.fromjson(
      //   jsondata["reting"],
      // ),
    );
  }
}

// class RatingModel {
//   final double rate;
//   final double count;
//   RatingModel({
//     required this.count,
//     required this.rate,
//   });
//   factory RatingModel.fromjson(jsondata) {
//     return RatingModel(
//       rate: jsondata["rate"],
//       count: jsondata["count"],
//     );
//   }
// }
