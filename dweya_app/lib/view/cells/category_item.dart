import 'package:dweya_app/view/category_detail_screen/category_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/Category.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class CategoryItem extends StatelessWidget {
  Category? category;
  // for left padding
  bool isFirstItem;
  double itemWidth;
  double itemHeight;
  CategoryItem(
      {this.category,
      this.isFirstItem = false,
      this.itemWidth = 200,
      this.itemHeight = 100});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                      title: this.category?.name,
                    )));
      }),
      child: Padding(
        padding: EdgeInsets.only(
            top: 10, right: 10, left: isFirstItem ? 0 : 10, bottom: 5),
        child: Column(
          children: [
            Container(
              height: itemHeight,
              width: itemWidth,
              child: Stack(
                children: [
                  Container(
                    height: itemHeight,
                    width: itemWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        LPConst.imageFolder + (category?.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          LPColors.primaryDarkBlue.withOpacity(0.8),
                        ],
                      )),
                    ),
                  ),
                  Positioned(
                      top: itemHeight - 30,
                      child: Container(
                        width: itemWidth,
                        child: Text(
                          "(" +
                              (category?.total ?? 0).toString() +
                              " Médicaments)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: LPColors.white,
                              fontFamily: LPFonts.sfProRegular,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              letterSpacing: 0.18),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              width: itemWidth,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  category?.name ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: LPColors.white,
                      fontFamily: LPFonts.sfProRegular,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 0.18),
                ),
              ),
            ),
            /*Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    "(" + (category?.total ?? 0).toString() + " Médicaments)",
                    style: TextStyle(
                        color: LPColors.grey5,
                        fontFamily: LPFonts.sfProRegular,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        letterSpacing: 0.18),
                  ),
                )*/
          ],
        ),
      ),
    );
  }
}
