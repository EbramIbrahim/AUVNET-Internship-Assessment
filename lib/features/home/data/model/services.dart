class ServicesModel {
  String? name;
  String? offer;
  String? offerImage;

  ServicesModel({this.name, this.offer, this.offerImage});


  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      name: json['name'],
      offer: json['offer'],
      offerImage: json['offer_image']
    );
  }

}