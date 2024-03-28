class PDetailModel {
  final String name;
  final double price;
  final String? description;
  final Map<String, dynamic>? reviews;
  final List<String>? imageUrls;

  PDetailModel({required this.name, required this.price, this.description, this.reviews,this.imageUrls, });
  

}

class ReviewModel {
  final String review;
  final int rating;

  ReviewModel({required this.review, required this.rating});
  
}