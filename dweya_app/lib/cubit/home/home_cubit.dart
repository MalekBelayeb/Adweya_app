import 'package:dweya_app/data/models/medicine_models.dart';
import 'package:dweya_app/data/services/category_service.dart';
import 'package:dweya_app/data/services/medicine_service.dart';
import 'package:dweya_app/model/category.dart';
import 'package:dweya_app/model/medicine.dart';
import 'package:dweya_app/utils/koko_consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_satate.dart';
import 'package:dweya_app/data/models/category_models.dart';

class HomeCubit extends Cubit<HomeState> {
  late MedicineService medicineService;
  late CategoryService categoryService;

  HomeCubit() : super(HomeInitialState()) {
    medicineService = MedicineService();
    categoryService = CategoryService();
  }

  Future<void> getAllMedicines() async {
    try {
      emit(GetAllMedicinesLoadingState());
      final getAllMedicinesRes = await medicineService
          .getAllMedicines("${KOKOConst.host}${KOKOConst.getAllMedicinesUrl}");

      if (getAllMedicinesRes is GetAllMedicinesSuccessRes) {
        var x = 0;

        List<Medicine> allMedicines = getAllMedicinesRes.medicines.map((e) {
          var medicine = Medicine(
              id: e.idMedicament,
              name: e.desComm,
              cover: "med_cover.jpg",
              fullName: e.desInter,
              category: e.category,
              status: e.status);
          if (medicine.name == "TRACURIUM 50 MG") {
            medicine.cover = "med3.jpg";
          }

          if (medicine.name == "MERCAINE") {
            medicine.cover = "med2.jpg";
          }

          if (medicine.name == "MERCAINE RACHI") {
            medicine.cover = "med1.png";
          }

          if (medicine.name == "NIMBEX 10 MG") {
            medicine.cover = "med4.png";
          }

          return medicine;
        }).toList();

        emit(GetAllMedicinesSuccessState(medicines: allMedicines));
      } else {
        emit(GetAllMedicinesErrorState());
      }
    } catch (error) {
      print(error);
    }
  }

  void getAllMedicinesByCategory(id) async {
    try {
      emit(GetAllMedicinesByCatLoadingState());
      final getAllMedicinesRes =
          await medicineService.getAllMedicinesByCategory(
              "${KOKOConst.host}${KOKOConst.getAllCategoriesByCatUrl}/${id}");

      if (getAllMedicinesRes is GetAllMedicinesSuccessRes) {
        List<Medicine> allMedicines = getAllMedicinesRes.medicines.map((e) {
          return Medicine(
              id: e.idMedicament,
              name: e.desComm,
              cover: "cat_cover.jpg",
              fullName: e.desInter,
              category: e.category,
              status: e.status);
        }).toList();

        emit(GetAllMedicinesByCatSuccessState(medicines: allMedicines));
      } else {
        emit(GetAllMedicinesByCatErrorState());
      }
    } catch (error) {
      print(error);
    }
  }

  void updateMedecineStock(id, status) async {
    try {
      emit(UpdateMedecineLoadingState());

      var updateMedecineBodyReq = UpdateMedecineBodyReq(
        id: id,
        status: status,
      );
      final updateResponse = await medicineService.updateMedicine(
          "${KOKOConst.host}${KOKOConst.updateMedicamentUrl}",
          updateMedecineBodyReq);

      if (updateResponse is UpdateMedicineSuccessRes) {
        emit(UpdateMedecineSuccessState());
      } else if (updateResponse is UpdateMedicineErrorRes) {
        emit(UpdateMedecineErrorState());
      }
    } catch (e) {
      emit(UpdateMedecineErrorState());
    }
  }

  void getAllCategories() async {
    try {
      emit(GetAllCategoriesLoadingState());
      final getAllCategoriesRes = await categoryService.getAllCategories(
          "${KOKOConst.host}${KOKOConst.getAllCategoriesUrl}");

      if (getAllCategoriesRes is GetAllCategoriesSuccessRes) {
        List<Category> allCategories = getAllCategoriesRes.categories.map((e) {
          return Category(
              id: e.idCategory,
              name: e.nomCat,
              image: 'cat_cover.jpg',
              total: e.total);
        }).toList();

        emit(GetAllCategoriesSuccessState(categories: allCategories));
      } else {
        emit(GetAllCategoriesErrorState());
      }
    } catch (error) {
      print(error);
    }
  }
}
