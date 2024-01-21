import 'package:cipherschool/Model/categoryModel.dart';

class TranscationModel {
  late int amount;
  late String category;
  late String icon;
  late String iconcolor;
  late String description;
  late String date;

  TranscationModel({required this.amount, required this.category, required this.description, required this.date, required this.icon, required this.iconcolor});

  TranscationModel.fromMapObject(Map<String, dynamic> json) {

    amount = json['Amount']??0;
    category = json['Category']??'';
    description = json['Description']??'';
    date = json['Date']??'';
    iconcolor = json['color']??'';
    icon = json['icon']??'';

  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Amount'] = this.amount;
    data['Category'] = this.category;
    data['Description'] = this.description;
    data['color'] = this.iconcolor;
    data['icon'] = this.icon;
    print("data is $data");
    return data;
  }
}