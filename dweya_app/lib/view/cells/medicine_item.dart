// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/view/medicine_detail_screen/medicine_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class MedicineItem extends StatefulWidget {
  Medicine? medicine;
  // for left padding
  bool isFirstItem;
  double itemWidth;
  double itemHeight;

  MedicineItem(
      {this.medicine,
      this.isFirstItem = false,
      this.itemWidth = 400,
      required this.itemHeight});

  @override
  State<MedicineItem> createState() => _MedicineItemState();
}

class _MedicineItemState extends State<MedicineItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => {
            if (widget.medicine != null)
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicineDetailScreen(
                              medicine: widget.medicine!,
                            )))
              }
          }),
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.isFirstItem ? 10 : 15, right: 0, left: 0, bottom: 0),
        child: Row(
          children: [
            Container(
              width: widget.itemWidth * 0.44,
              height: widget.itemHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(LPConst.imageFolder +
                          (widget.medicine?.cover ?? ""))),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
            ),
            Container(
              width: widget.itemWidth * 0.56,
              height: widget.itemHeight,
              decoration: BoxDecoration(
                  color: LPColors.grey2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.74,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 0, bottom: 0),
                          child: Column(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: constraints.maxWidth * 0.3,
                                        child: Text(
                                          (widget.medicine?.name ?? ""),
                                          style: TextStyle(
                                              color: LPColors.white,
                                              fontFamily: LPFonts.sfProRegular,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              letterSpacing: 0.2),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.medicine?.category ?? "",
                                      style: TextStyle(
                                          color: LPColors.grey3,
                                          fontFamily: LPFonts.sfProRegular,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          letterSpacing: 0.18),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Container(
                          height: 1,
                          color: LPColors.grey4,
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, left: 12, right: 32, bottom: 0),
                          child: Column(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.medicine?.rate?.toString() ??
                                              "0",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: LPColors.green1,
                                              fontFamily: LPFonts.sfProRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              letterSpacing: 0.225),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            "Restants",
                                            style: TextStyle(
                                                color: LPColors.grey3,
                                                fontFamily:
                                                    LPFonts.sfProRegular,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: 0.18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
