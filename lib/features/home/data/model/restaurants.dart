import 'package:hive/hive.dart';
import 'package:nawel/hive_helper/fields/restaurants_model_fields.dart';
import 'package:nawel/hive_helper/hive_types.dart';

part 'restaurants.g.dart';

@HiveType(typeId: HiveTypes.restaurantsModel)
class RestaurantsModel extends HiveObject {
  @HiveField(RestaurantsModelFields.name)
  String? name;
  @HiveField(RestaurantsModelFields.time)
  String? time;
  @HiveField(RestaurantsModelFields.restaurantsImage)
  String? restaurantsImage;

  RestaurantsModel({this.name, this.time, this.restaurantsImage});

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
      name: json['name'],
      time: json['time'],
      restaurantsImage: json['image'],
    );
  }
}
