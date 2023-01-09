import 'package:dweya_app/cubit/home/home_cubit.dart';
import 'package:dweya_app/cubit/home/home_satate.dart';
import 'package:dweya_app/model/category.dart';
import 'package:dweya_app/model/medicine.dart';
import 'package:dweya_app/view/all_medicine_list_screen/all_medicine_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailScreen extends StatelessWidget {
  Category? category;
  List<Medicine> medicines = [];
  CategoryDetailScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        HomeCubit homeCubit = HomeCubit();
        homeCubit.getAllMedicinesByCategory(category?.id);
        return homeCubit;
      },
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: ((context, state) {
          if (state is GetAllMedicinesByCatSuccessState) {
            medicines = state.medicines;
          }
        }),
        builder: (context, state) {
          return Scaffold(
              body: AllMedicineList(
            title: this.category?.name ?? "",
            medicineList: medicines,
          ));
        },
      ),
    );
  }
}
