// ignore_for_file: prefer_const_constructors

import 'package:dweya_app/cubit/auth/auth_cubit.dart';
import 'package:dweya_app/cubit/auth/auth_state.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/utils/luckyplace_fonts.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_button.dart';
import 'package:dweya_app/view/login_screen/components/dweya_custom_textfield.dart';
import 'package:dweya_app/view/login_screen/login_screen.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthCubit();
      },
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: ((context, state) {}),
        builder: (context, state) {
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
                            headerTitle: "INSCRIPTION",
                            hideBackButton: true,
                            hideHamburgerMenu: true),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "S'INSCRIRE",
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
                                  "Remplissez les informations relatives à ce qui est demandé ci-dessous.",
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
                                    textController: _emailController,
                                    itemHeight: 50,
                                    placeholder: "Tapez votre e-mail ici",
                                    keyboardType: TextInputType.emailAddress),
                                SizedBox(
                                  height: 16,
                                ),
                                DWTextField(
                                  textController: _passwordController,
                                  itemHeight: 50,
                                  placeholder: "Tapez votre mot de passe ici",
                                  isPassword: true,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                DWTextField(
                                  itemHeight: 50,
                                  placeholder: "Retaper votre mot de passe ici",
                                  isPassword: true,
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                (state is SignupLoadingState)
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        backgroundColor: LPColors.green1,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.black,
                                        ),
                                      ))
                                    : DWButton(
                                        itemHeight: 50,
                                        title: "Sign up",
                                        onTap: () {
                                          context.read<AuthCubit>().register(
                                              _emailController.text,
                                              _passwordController.text);
                                        },
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(top: 32),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Déjà membre ? ",
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
                                          child: Text("Se connecter",
                                              style: TextStyle(
                                                  color: LPColors.white,
                                                  fontFamily:
                                                      LPFonts.sfProRegular,
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
        },
      ),
    );
  }
}
