// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_button.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_textfield.dart';
import 'package:dweya_app/view/login_screen/login_screen.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: LPColors.primaryDarkBlue,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              LPColors.primaryDarkBlue.withOpacity(0.1),
              Colors.black.withOpacity(0.5),
            ],
          )),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopHeaderView(
                    headerTitle: "SIGN UP",
                    hideBackButton: true,
                    hideHamburgerMenu: true),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Column(
                      children: [
                        DWTextField(
                            itemHeight: 50,
                            placeholder: "Type your email here",
                            keyboardType: TextInputType.emailAddress),
                        SizedBox(
                          height: 16,
                        ),
                        DWTextField(
                          itemHeight: 50,
                          placeholder: "Type your password here",
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DWTextField(
                          itemHeight: 50,
                          placeholder: "Re-type your password here",
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        DWButton(
                          itemHeight: 50,
                          title: "Sign up",
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Already a member ? ",
                                  style: TextStyle(
                                      color: LPColors.grey1,
                                      fontFamily: LPFonts.sfProRegular,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Sign in",
                                      style: TextStyle(
                                          color: LPColors.white,
                                          fontFamily: LPFonts.sfProRegular,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
