import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:flutter/material.dart';

class NextBottomButton extends StatelessWidget {
  String? title;
  double itemHeight;
  Function()? onTap;

  NextBottomButton({this.title, required this.itemHeight, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          height: itemHeight,
          decoration: BoxDecoration(
            color: LPColors.green1,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
              child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: LPColors.white,
                fontFamily: LPFonts.sfProRegular,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 0.17),
          )),
        ),
      ),
    );
  }
}
