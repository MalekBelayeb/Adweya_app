import 'package:dweya_app/view/all_medicine_list_screen/all_medicine_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  String? title;
  CategoryDetailScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AllMedicineList(
      title: this.title ?? "",
    ));
  }
}
