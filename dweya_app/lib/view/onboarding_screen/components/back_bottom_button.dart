import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:flutter/material.dart';

class BackBottomButton extends StatelessWidget {
  double itemWidth;

  double itemHeight;
  Function()? onTap;
  BackBottomButton(
      {required this.itemHeight, required this.itemWidth, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
                color: LPColors.white, borderRadius: BorderRadius.circular(20)),
          ),
          Center(
            child: Container(
              width: 25,
              height: 25,
              child: Image.asset(
                LPConst.imageFolder + "arrow-right.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
