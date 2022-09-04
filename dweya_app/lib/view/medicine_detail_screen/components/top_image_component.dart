import 'package:flutter/material.dart';
import 'package:dweya_app/model/Medicine.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';

class TopImageMedicineSection extends StatefulWidget {
  double itemHeight;
  Medicine? medicine;

  TopImageMedicineSection({required this.itemHeight, this.medicine});

  @override
  State<TopImageMedicineSection> createState() =>
      _TopImageMedicineSectionState();
}

class _TopImageMedicineSectionState extends State<TopImageMedicineSection> {
  bool notificationTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.itemHeight,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints imageConstraints) {
          return Stack(
            children: [
              Container(
                height: imageConstraints.maxHeight,
                width: imageConstraints.maxWidth,
                child: Image.asset(
                  LPConst.imageFolder + (widget.medicine?.cover ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: imageConstraints.maxWidth,
                height: imageConstraints.maxHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Colors.transparent.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ],
                )),
              ),
              Container(
                  width: imageConstraints.maxWidth,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            LPConst.imageFolder + "left_arrow_icon.png",
                            height: 18,
                            width: 18,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: LPFonts.sfProRegular,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.175),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            LPConst.imageFolder +
                                (notificationTapped
                                    ? "notification_fill.png"
                                    : "notification.png"),
                            height: 32,
                            width: 32,
                          ),
                          onTap: () => {
                            setState(() =>
                                {notificationTapped = !notificationTapped})
                          },
                        )
                      ],
                    ),
                  )),
            ],
          );
        }));
  }
}
