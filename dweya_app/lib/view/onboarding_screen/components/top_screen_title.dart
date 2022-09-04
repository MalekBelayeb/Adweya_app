import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:flutter/cupertino.dart';

class TopScreenTitle extends StatelessWidget {
  String? title;
  String? subTitle;

  TopScreenTitle({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(title ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: LPColors.white,
                fontFamily: LPFonts.sfProRegular,
                fontWeight: FontWeight.w700,
                fontSize: 32,
                letterSpacing: 0.4)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 78),
          child: Text(
            subTitle ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: LPColors.grey6,
                fontFamily: LPFonts.sfProRegular,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.4),
          ),
        )
      ],
    ));
  }
}
