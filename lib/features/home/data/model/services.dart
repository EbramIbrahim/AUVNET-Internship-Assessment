
import 'package:hive/hive.dart';
import 'package:nawel/hive_helper/hive_types.dart';
import 'package:nawel/hive_helper/fields/services_model_fields.dart';

part 'services.g.dart';

@HiveType(typeId: HiveTypes.servicesModel)
class ServicesModel extends HiveObject {
  @HiveField(ServicesModelFields.name)
  String? name;
  @HiveField(ServicesModelFields.offer)
  String? offer;
  @HiveField(ServicesModelFields.offerImage)
  String? offerImage;

  ServicesModel({this.name, this.offer, this.offerImage});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      name: json['name'],
      offer: json['offer'],
      offerImage: json['offer_image'],
    );
  }
}
