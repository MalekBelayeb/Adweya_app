import 'package:dweya_app/view/medicine_detail_screen/components/body_medicine_info_item.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/medicine.dart';
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
              SizedBox(
                height: 12,
              ),
              Container(
                child: Text(
                  medicine?.name ?? "",
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
                medicine?.fullName ?? "",
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
                height: 24,
              ),
              Container(
                child: Text(
                  "Avis & commentaire:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: LPColors.white,
                      fontFamily: LPFonts.sfProRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0.4),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "La plupart des médicaments existent en comprimé. Certains, trop irritants, sont recouverts d'une pellicule gastrorésistante. Actif: de 1h30 à 2 heures après la prise",
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
                id: medicine?.id ?? 0,
                title: "Etat",
                info: (medicine?.status ?? "0") == "0"
                    ? "Disponible"
                    : (medicine?.status ?? "0") == "1"
                        ? "Limité"
                        : (medicine?.status ?? "0") == "2"
                            ? "Epuisé"
                            : "",
                isQuantityInfo: true,
              ),
              BodyMedicineInfoItem(
                id: 0,
                title: "Catégorie",
                info: medicine?.category ?? "",
              ),
            ],
          ),
        ));
  }
}
