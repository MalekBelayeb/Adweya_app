// ignore_for_file: prefer_const_constructors
import 'package:dweya_app/cubit/home/home_cubit.dart';
import 'package:dweya_app/cubit/home/home_satate.dart';
import 'package:dweya_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:dweya_app/model/category.dart';
import 'package:dweya_app/model/medicine.dart';
import 'package:dweya_app/utils/luckyplace_colors.dart';
import 'package:dweya_app/view/home_screen/components/all_medicines_section.dart';
import 'package:dweya_app/view/home_screen/components/horizontal_categories_section.dart';
import 'package:dweya_app/view/shared/top_header_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  User? user;
  HomeScreen({this.user});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

class _HomeScreenState extends State<HomeScreen> {
  List<Medicine> medicineList = [];
  List<Category> categoryList = [];
  late BuildContext medContext;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          HomeCubit homeCubit = HomeCubit();
          homeCubit.getAllCategories();
          homeCubit.getAllMedicines();
          return homeCubit;
        },
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is GetAllCategoriesSuccessState) {
              this.categoryList = state.categories;
            }
            if (state is GetAllMedicinesSuccessState) {
              this.medicineList = state.medicines;
            }
          },
          builder: (context, state) {
            return RefreshIndicator(
                key: _refreshIndicatorKey,
                child: Scaffold(
                    body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: LPColors.primaryDarkBlue,
                  child: Padding(
                    padding: EdgeInsets.only(top: 64, left: 16, right: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TopHeaderView(
                            headerTitle: "COCO PHARMACIE",
                            hideHamburgerMenu: true,
                            hideBackButton: true,
                          ),
                          Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 64),
                              child: Container(
                                  child: Column(children: [
                                SizedBox(
                                  height: 42,
                                ),
                                HorizontalCategoriesSection(
                                  titleSection: "Classe thérapeutique",
                                  categoryList: categoryList,
                                  isLoading:
                                      (state is GetAllCategoriesLoadingState),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                AllMedicinesSection(
                                  medicineList: medicineList,
                                  isLoading:
                                      (state is GetAllMedicinesLoadingState),
                                )
                              ])),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                )),
                onRefresh: () async {
                  context.read<HomeCubit>().getAllCategories();
                  context.read<HomeCubit>().getAllMedicines();
                });
          },
        ));
  }
}
