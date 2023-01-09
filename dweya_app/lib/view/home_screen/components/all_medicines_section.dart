import 'package:dweya_app/view/all_medicine_list_screen/all_medicine_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/cells/medicine_item.dart';

class AllMedicinesSection extends StatelessWidget {
  List<Medicine> medicineList;
  bool isLoading;
  AllMedicinesSection({required this.medicineList, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Liste des médicaments",
            style: TextStyle(
                color: LPColors.white,
                fontFamily: LPFonts.sfProRegular,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 0.2),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllMedicineList(
                            medicineList: medicineList ?? [],
                          )));
            },
            child: Text("VOIR PLUS",
                style: TextStyle(
                    color: LPColors.grey1,
                    fontFamily: LPFonts.sfProRegular,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    letterSpacing: 0.18)),
          )
        ],
      ),
      (isLoading)
          ? Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: LPColors.green1,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.black,
                ),
              )),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 200 *
                  (((medicineList.length) > 10) ? 10 : medicineList.length)
                      .toDouble(),
              child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      ((medicineList.length) > 10) ? 10 : medicineList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MedicineItem(
                      medicine: medicineList[index],
                      isFirstItem: index == 0,
                      itemHeight: 150,
                      itemWidth: MediaQuery.of(context).size.width - 32,
                    );
                  })),
    ]);
  }
}
