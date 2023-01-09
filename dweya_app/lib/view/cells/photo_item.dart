import 'package:flutter/material.dart';
import 'package:dweya_app/utils/koko_consts.dart';

class PhotoItem extends StatelessWidget {
  var photo = "";
  double itemWidth;

  PhotoItem({required this.photo, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: double.infinity,
        width: itemWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "${KOKOConst.imageFolder}${photo}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
