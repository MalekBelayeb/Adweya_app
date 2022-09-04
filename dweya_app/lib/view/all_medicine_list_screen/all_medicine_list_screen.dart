import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/cells/medicine_item.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:flutter/material.dart';

class AllMedicineList extends StatelessWidget {
  var medicineList = [
    Medicine(
        name: "DOLIPRANE VIT.C 500mg/150mg Comp eff. Bt 16",
        cover: "medi3.png",
        category: "Antalgique",
        location: "Antalgique",
        rate: 8),
    Medicine(
        name: "ASPEGIC 100mg Pdre.Sol.Or. Bt 20Sach",
        cover: "medi1.jpg",
        category: "Infectiologie",
        location: "Tunis",
        rate: 2),
    Medicine(
        name: "EFFERALGAN 1gr Comp.Efferv. Bt 1Tb/8",
        cover: "medi2.png",
        category: "Antalgique",
        location: "Hammamet",
        rate: 5),
    Medicine(
        name: "DOLIPRANE VIT.C 500mg/150mg Comp eff. Bt 16",
        cover: "medi3.png",
        category: "Antalgique",
        location: "Antalgique",
        rate: 8),
    Medicine(
        name: "ASPEGIC 100mg Pdre.Sol.Or. Bt 20Sach",
        cover: "medi1.jpg",
        category: "Infectiologie",
        location: "Tunis",
        rate: 2),
    Medicine(
        name: "EFFERALGAN 1gr Comp.Efferv. Bt 1Tb/8",
        cover: "medi2.png",
        category: "Antalgique",
        location: "Hammamet",
        rate: 5),
  ];
  String? title;
  AllMedicineList({this.title = "Tous les médicaments"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LPColors.primaryDarkBlue,
        child: Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              TopHeaderView(
                headerTitle: this.title ?? "",
                hideBackButton: true,
                hideHamburgerMenu: true,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 82, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Liste des médicaments (${this.medicineList.length})",
                          style: TextStyle(
                              color: LPColors.white,
                              fontFamily: LPFonts.sfProRegular,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 0.2),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: ListView.builder(
                              shrinkWrap: false,
                              scrollDirection: Axis.vertical,
                              itemCount: medicineList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MedicineItem(
                                  medicine: medicineList[index],
                                  isFirstItem: index == 0,
                                  itemHeight: 150,
                                  itemWidth:
                                      MediaQuery.of(context).size.width - 32,
                                );
                              }))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
