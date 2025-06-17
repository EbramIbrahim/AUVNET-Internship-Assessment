class RestaurantsModel {
  String? name;
  String? time;
  String? restaurantsImage;

  RestaurantsModel({this.name, this.time, this.restaurantsImage});


  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
        name: json['name'],
        time: json['time'],
        restaurantsImage: json['image']
    );
  }
}