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


class Product {
  final String name;
  final double price;
  final String imageUrl;

  
 factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
    );
 }

  Product({required this.name, required this.price, required this.imageUrl});
} 

class SearchModel{
  final String searchWord;
  final List<String>? filters;
  final int? low;
  final int? high;
  final String? category;

  SearchModel({this.high, this.category, required this.searchWord, this.filters, this.low});

  Map<String, String> toJson () {
    return {
      "searchWord": searchWord,
      if(category!=null)"category": category!,
      if(low!=null)"low":low.toString(),
      if(high!=null)"high": high.toString()
    };
    }  
}