import 'package:hive/hive.dart';
import 'package:nawel/hive_helper/hive_types.dart';
import 'package:nawel/hive_helper/fields/shortcuts_model_fields.dart';

part 'shortcuts.g.dart';

@HiveType(typeId: HiveTypes.shortcutsModel)
class ShortcutsModel extends HiveObject {
  @HiveField(ShortcutsModelFields.name)
  String? name;
  @HiveField(ShortcutsModelFields.shortcutImage)
  String? shortcutImage;

  ShortcutsModel({this.name, this.shortcutImage});

  factory ShortcutsModel.fromJson(Map<String, dynamic> json) {
    return ShortcutsModel(
      name: json['name'],
      shortcutImage: json['shortcut_image'],
    );
  }
}
