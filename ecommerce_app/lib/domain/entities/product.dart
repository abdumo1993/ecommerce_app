class PDetailModel {
  final String name;
  final double price;
  final String? description;
  final Map<String, dynamic>? reviews;
  final List<String>? imageUrls;

  PDetailModel({
    required this.name,
    required this.price,
    this.description,
    this.reviews,
    this.imageUrls,
  });

  PDetailModel fromJson(Map<String, dynamic> json) {
    return PDetailModel(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        reviews: json["reviews"],
        imageUrls: json["imageUrls"]);
  }
}

class ReviewModel {
  final String review;
  final int rating;

  ReviewModel({required this.review, required this.rating});
  Map<String, dynamic> toJson() {
    return {"Review": review, "Rating": rating};
  }
}
