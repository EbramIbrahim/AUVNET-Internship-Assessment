class ShortcutsModel {
  String? name;
  String? shortcutImage;

  ShortcutsModel({this.name, this.shortcutImage});


  factory ShortcutsModel.fromJson(Map<String, dynamic> json) {
    return ShortcutsModel(
        name: json['name'],
        shortcutImage: json['shortcut_image']
    );
  }
}