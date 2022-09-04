import 'package:flutter/material.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class BodyMedicineInfoItem extends StatelessWidget {
  String title;
  String info;
  bool isQuantityInfo;
  BodyMedicineInfoItem(
      {required this.title, required this.info, this.isQuantityInfo = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: LPColors.grey5),
              ),
              Text(
                info,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: isQuantityInfo ? LPColors.green1 : LPColors.grey1,
                    fontFamily: isQuantityInfo
                        ? LPFonts.sfProSemiBold
                        : LPFonts.sfProRegular,
                    fontWeight: FontWeight.w500,
                    fontSize: isQuantityInfo ? 16 : 14,
                    letterSpacing: 0.225),
              )
            ],
          ),
        ),
        Divider(
          height: 2,
          color: LPColors.grey4,
        )
      ],
    );
  }
}
