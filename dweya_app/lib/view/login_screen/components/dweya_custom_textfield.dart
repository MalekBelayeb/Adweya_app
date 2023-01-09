import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';

class DWTextField extends StatelessWidget {
  double? itemWidth;
  double itemHeight;
  String? placeholder;
  bool isPassword;
  TextInputType keyboardType;
  TextEditingController? textController;

  DWTextField(
      {required this.itemHeight,
      this.itemWidth,
      this.placeholder,
      this.isPassword = false,
      this.textController,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth ?? MediaQuery.of(context).size.width,
      height: itemHeight,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: LPColors.white.withOpacity(0.4),
              width: 1,
              style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: textController,
          keyboardType: keyboardType,
          obscureText: isPassword,
          style: TextStyle(
              color: LPColors.grey1,
              fontFamily: LPFonts.sfProRegular,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.17),
          decoration: InputDecoration(
              hintText: placeholder ?? "",
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: LPColors.grey1,
                  fontFamily: LPFonts.sfProRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.17)),
        ),
      ),
    );
  }
}
