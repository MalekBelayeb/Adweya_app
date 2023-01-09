import 'package:dweya_app/cubit/home/home_cubit.dart';
import 'package:dweya_app/cubit/home/home_satate.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyMedicineInfoItem extends StatefulWidget {
  int id;
  String title;
  String info;
  bool isQuantityInfo;

  BodyMedicineInfoItem(
      {required this.id,
      required this.title,
      required this.info,
      this.isQuantityInfo = false});

  @override
  State<BodyMedicineInfoItem> createState() => _BodyMedicineInfoItemState();
}

class _BodyMedicineInfoItemState extends State<BodyMedicineInfoItem> {
  String dropdownvalue = "Disponible";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownvalue = widget.info;
    getUserRole();
  }

  getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isAdmin = (prefs.getInt("role") ?? 0) == 1;
    });
  }

  bool isAdmin = true;

  var items = [
    'Disponible',
    'Limité',
    'Epuisé',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) {
          return HomeCubit();
        }),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: ((context, state) {}),
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: LPColors.grey5),
                      ),
                      (isAdmin && widget.isQuantityInfo)
                          ? DropdownButton(
                              dropdownColor: LPColors.primaryDarkBlue,
                              value: dropdownvalue,
                              underline: const SizedBox(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue = value ?? "";
                                  int status = value == "Disponible"
                                      ? 0
                                      : value == "Epuisé"
                                          ? 2
                                          : value == "Limité"
                                              ? 1
                                              : 0;
                                  context.read<HomeCubit>().updateMedecineStock(
                                      this.widget.id, status);
                                });
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: (item == "Disponible")
                                            ? LPColors.green1
                                            : (item == "Limité")
                                                ? LPColors.yellow
                                                : (item == "Epuisé")
                                                    ? LPColors.red
                                                    : LPColors.green,
                                        fontFamily: LPFonts.sfProRegular,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: 0.225),
                                  ),
                                );
                              }).toList(),
                            )
                          : Text(
                              widget.info,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: (widget.info == "Disponible")
                                      ? LPColors.green1
                                      : (widget.info == "Limité")
                                          ? LPColors.yellow
                                          : (widget.info == "Epuisé")
                                              ? LPColors.red
                                              : LPColors.green,
                                  fontFamily: widget.isQuantityInfo
                                      ? LPFonts.sfProSemiBold
                                      : LPFonts.sfProRegular,
                                  fontWeight: FontWeight.w500,
                                  fontSize: widget.isQuantityInfo ? 16 : 14,
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
          },
        ));
  }
}
