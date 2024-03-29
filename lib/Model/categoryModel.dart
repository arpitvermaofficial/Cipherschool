import 'dart:ui';
class CategoryModel {
  late String? category = "";
  late String? icon = "";
  late Color? iconcolor = Color(0xff0077FF);

  CategoryModel({
    required this.category,
    required this.icon,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    icon = json['icon'];
    iconcolor = json['iconcolor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['icon'] = this.icon;
    data['iconcolor'] = this.iconcolor;
    return data;
  }
}
