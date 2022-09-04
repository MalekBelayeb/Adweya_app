import 'package:dweya_app/view/all_categories_list_screen/all_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/Category.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/cells/category_item.dart';

class HorizontalCategoriesSection extends StatelessWidget {
  List<Category>? categoryList;
  String titleSection;

  HorizontalCategoriesSection({this.categoryList, required this.titleSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this.titleSection,
              style: TextStyle(
                  color: LPColors.white,
                  fontFamily: LPFonts.sfProRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 0.2),
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllCategoriesList()));
              }),
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
        SizedBox(
          height: 20,
        ),
        Container(
          height: 180,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList?.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(
                  category: categoryList?[index],
                  isFirstItem: index == 0 ? true : false,
                  itemWidth: 150,
                  itemHeight: 120,
                );
              }),
        )
      ],
    );
  }
}
