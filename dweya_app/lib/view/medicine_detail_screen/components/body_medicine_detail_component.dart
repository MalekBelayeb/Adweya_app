import 'package:dweya_app/view/medicine_detail_screen/components/body_medicine_info_item.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class BodyMedicineDetailSection extends StatelessWidget {
  Medicine? medicine;

  BodyMedicineDetailSection({this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.68,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "DOLIPRANE VIT.C 500mg/150mg Comp eff. Bt 16",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: LPColors.white,
                      fontFamily: LPFonts.sfProRegular,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0.4),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: LPFonts.sfProRegular,
                    height: 1.3,
                    color: LPColors.grey1,
                    fontSize: 14,
                    letterSpacing: 0.17,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40,
              ),
              BodyMedicineInfoItem(
                title: "QTE RESTANTE",
                info: "3",
                isQuantityInfo: true,
              ),
              BodyMedicineInfoItem(
                title: "LABORATOIRE",
                info: "Sanofi",
              ),
              BodyMedicineInfoItem(
                title: "CLASSE",
                info: "Dermatologie",
              ),
              BodyMedicineInfoItem(
                title: "SOUS-CLASSE",
                info: "Dermatologie",
              )
            ],
          ),
        ));
  }
}
