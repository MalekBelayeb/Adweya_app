// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dweya_app/model/Category.dart';
import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/view/home_screen/components/all_medicines_section.dart';
import 'package:dweya_app/view/home_screen/components/horizontal_categories_section.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';

class HomeScreen extends StatelessWidget {
  var categoryTherapeutiqueList = [
    Category(name: "ALLERGOLOGIE ", image: "cat3.jpg", total: 80),
    Category(name: "DERMATOLOGIE", image: "cat3.jpg", total: 65),
    Category(name: "CANCEROLOGIE", image: "cat3.jpg", total: 220),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: LPColors.primaryDarkBlue,
      child: Padding(
        padding: EdgeInsets.only(top: 64, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHeaderView(
                headerTitle: "COCO PHARMACIE",
                hideHamburgerMenu: true,
                hideBackButton: true,
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 64),
                  child: Container(
                      child: Column(children: [
                    SizedBox(
                      height: 42,
                    ),
                    HorizontalCategoriesSection(
                      categoryList: categoryTherapeutiqueList,
                      titleSection: "Classe thérapeutique",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AllMedicinesSection(
                      medicineList: medicineList,
                    )
                  ])),
                )
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}
