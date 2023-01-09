import 'package:flutter/material.dart';
import 'package:dweya_app/utils/koko_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class TopHeaderView extends StatelessWidget {
  bool hideBackButton;
  bool hideHamburgerMenu;
  String headerTitle;
  TopHeaderView(
      {this.hideBackButton = false,
      this.hideHamburgerMenu = false,
      required this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!hideBackButton) ...{
          Image.asset(
            KOKOConst.imageFolder + "left_arrow_icon.png",
            height: 18,
            width: 18,
          )
        } else ...{
          SizedBox(width: 18, height: 18)
        },
        Text(
          headerTitle,
          style: TextStyle(
              color: Colors.white,
              fontFamily: LPFonts.sfProRegular,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.175),
        ),
        if (!hideHamburgerMenu) ...{
          Image.asset(
            KOKOConst.imageFolder + "hamburger_menu_icon.png",
            height: 24,
            width: 24,
          )
        } else ...{
          SizedBox(
            height: 24,
            width: 24,
          )
        }
      ],
    );
  }
}
