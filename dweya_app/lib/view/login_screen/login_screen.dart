// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_button.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_textfield.dart';
import 'package:dweya_app/view/onboarding_screen/onboarding_screen.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:dweya_app/view/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
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
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopHeaderView(
                      headerTitle: "CONNEXION",
                      hideBackButton: true,
                      hideHamburgerMenu: true),
                  Lottie.asset(LPConst.lottieFolder + "login_lottie.json",
                      height: 220),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SE CONNECTER",
                            style: TextStyle(
                                color: LPColors.white,
                                fontFamily: LPFonts.sfProRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: 0.16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Fermentum erat nisl duis varius risus. Augue ac facilisi porta metus enim.",
                            style: TextStyle(
                                color: LPColors.grey5,
                                fontFamily: LPFonts.sfProRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                letterSpacing: 0.16),
                          ),
                          SizedBox(
                            height: 32,
                          ),
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
                            height: 32,
                          ),
                          DWButton(
                            itemHeight: 50,
                            title: "CONNEXION",
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnBoardingScreen()));
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ? ",
                                    style: TextStyle(
                                        color: LPColors.white,
                                        fontFamily: LPFonts.sfProRegular,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen()));
                                    },
                                    child: Text("Sign up",
                                        style: TextStyle(
                                            color: LPColors.green1,
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
        ),
      ],
    ));
  }
}
