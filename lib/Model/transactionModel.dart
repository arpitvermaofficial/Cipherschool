import 'package:cipherschool/Model/categoryModel.dart';

class TransacationModel {
  late int amount;
  late String category;
  late String icon;
  late String iconcolor;
  late String description;
  late String time;

  TransacationModel(
      {required this.amount,
      required this.category,
      required this.description,
      required this.time,
      required this.icon,
      required this.iconcolor});

  factory TransacationModel.fromMapObject(Map<String, dynamic> json) {
    return TransacationModel(
        amount: json['amount'] ?? 0,
        category: json['category'] ?? "",
        description: json['description'] ?? "",
        time: json['time'] ?? "",
        icon: json['icon'] ?? "",
        iconcolor: json['color'] ?? "");
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['amount'] = this.amount;
    data['category'] = this.category;
    data['description'] = this.description;
    data['color'] = this.iconcolor;
    data['icon'] = this.icon;
    print("data is $data");
    return data;
  }
}
