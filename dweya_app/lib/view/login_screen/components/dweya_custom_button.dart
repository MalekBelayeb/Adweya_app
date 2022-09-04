import 'package:flutter/material.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class DWButton extends StatelessWidget {
  double? itemWidth;
  double itemHeight;
  String? title;
  Function()? onTap;

  DWButton({required this.itemHeight, this.itemWidth, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: itemWidth ?? MediaQuery.of(context).size.width,
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
              color: LPColors.grey7,
              fontFamily: LPFonts.sfProRegular,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0.17),
        )),
      ),
    );
  }
}
