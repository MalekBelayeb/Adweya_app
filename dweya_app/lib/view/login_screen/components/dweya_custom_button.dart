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
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: LPColors.green1,
            fixedSize: Size(
                itemWidth ?? MediaQuery.of(context).size.width, itemHeight),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: LPColors.grey7,
              fontFamily: LPFonts.sfProRegular,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0.17),
        ));
  }
}
