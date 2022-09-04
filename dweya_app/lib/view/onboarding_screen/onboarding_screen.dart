// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_consts.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/home_screen/home_screen.dart';
import 'package:dweya_app/view/onboarding_screen/components/back_bottom_button.dart';
import 'package:dweya_app/view/onboarding_screen/components/next_bottom_button.dart';
import 'package:dweya_app/view/onboarding_screen/components/top_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingItem {
  String title;
  String subTitle;
  String lottieName;
  OnboardingItem(
      {required this.title, required this.subTitle, required this.lottieName});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: false);

  int pageIndex = 0;

  List<OnboardingItem> onBoardingList = [
    OnboardingItem(
        title: "Chercher",
        subTitle:
            "Chercher ou filtrer les médicaments par leurs noms ou catégories",
        lottieName: "onboarding_1.json"),
    OnboardingItem(
        title: "Vérifier",
        subTitle:
            "Vérifier la disponibilité des médicaments et le nombre du stock restant",
        lottieName: "onboarding_2.json"),
    OnboardingItem(
        title: "Terminer",
        subTitle: "Sed ut perspiciatis unde omnis iste natus error sit.",
        lottieName: "onboarding_3.json")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: LPColors.primaryDarkBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 62),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopScreenTitle(
                    title: onBoardingList[pageIndex].title,
                    subTitle: onBoardingList[pageIndex].subTitle),
                Container(
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 42),
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: ((value) {
                        setState(() {
                          pageIndex = value;
                        });
                      }),
                      children: <Widget>[
                        for (var page in onBoardingList) ...{
                          Container(
                              child: Lottie.asset(
                            LPConst.lottieFolder + page.lottieName,
                          ))
                        },
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      pageIndex == 0
                          ? Container()
                          : BackBottomButton(
                              itemHeight: 50,
                              itemWidth: 50,
                              onTap: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeInOut);
                              },
                            ),
                      SizedBox(
                        width: 32,
                      ),
                      NextBottomButton(
                        itemHeight: 50,
                        title: "Suivant",
                        onTap: () {
                          if (pageIndex == onBoardingList.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 700),
                                curve: Curves.easeInOut);
                          }
                        },
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }
}
