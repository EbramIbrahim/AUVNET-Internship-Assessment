import 'package:hive/hive.dart';
import 'package:nawel/hive_helper/hive_types.dart';
import 'package:nawel/hive_helper/fields/promotions_model_fields.dart';

part 'promotions.g.dart';

@HiveType(typeId: HiveTypes.promotionsModel)
class PromotionsModel extends HiveObject {
  @HiveField(PromotionsModelFields.image)
  String? image;

  PromotionsModel({this.image});

  factory PromotionsModel.fromJson(Map<String, dynamic> json) {
    return PromotionsModel(image: json['promo_image']);
  }
}
