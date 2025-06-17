class PromotionsModel {
  String? image;

  PromotionsModel({this.image});


  factory PromotionsModel.fromJson(Map<String, dynamic> json) {
    return PromotionsModel(
        image: json['promo_image']
    );
  }
}