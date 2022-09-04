import 'package:flutter/material.dart';
import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/view/medicine_detail_screen/components/body_medicine_detail_component.dart';
import 'package:dweya_app/view/medicine_detail_screen/components/top_image_component.dart';

class MedicineDetailScreen extends StatelessWidget {
  Medicine medicine;
  MedicineDetailScreen({required this.medicine});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: LPColors.primaryDarkBlue),
        child: Column(children: [
          TopImageMedicineSection(
            itemHeight: MediaQuery.of(context).size.height * 0.32,
            medicine: this.medicine,
          ),
          BodyMedicineDetailSection(
            medicine: this.medicine,
          )
        ]),
      ),
    );
  }
}
