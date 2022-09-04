// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/model/Category.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/cells/category_item.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:flutter/material.dart';

class AllCategoriesList extends StatelessWidget {
  var categoryTherapeutiqueList = [
    Category(name: "ALLERGOLOGIE ", image: "cat3.jpg", total: 80),
    Category(name: "DERMATOLOGIE", image: "cat3.jpg", total: 65),
    Category(name: "CANCEROLOGIE", image: "cat3.jpg", total: 220),
    Category(name: "ALLERGOLOGIE ", image: "cat3.jpg", total: 80),
    Category(name: "DERMATOLOGIE", image: "cat3.jpg", total: 65),
    Category(name: "CANCEROLOGIE", image: "cat3.jpg", total: 220),
    Category(name: "ALLERGOLOGIE ", image: "cat3.jpg", total: 80),
    Category(name: "DERMATOLOGIE", image: "cat3.jpg", total: 65),
    Category(name: "CANCEROLOGIE", image: "cat3.jpg", total: 220),
  ];

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
                headerTitle: "Tous les classes",
                hideBackButton: true,
                hideHamburgerMenu: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 82, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Liste des classes (${this.categoryTherapeutiqueList.length})",
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
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            children: [
                              for (var cat in categoryTherapeutiqueList) ...{
                                CategoryItem(
                                  category: cat,
                                  isFirstItem: false,
                                  itemWidth: 150,
                                  itemHeight: 120,
                                )
                              }
                            ],
                          ))
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
