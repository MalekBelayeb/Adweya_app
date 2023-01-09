import 'package:dweya_app/model/category.dart';
import 'package:dweya_app/model/medicine.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllMedicinesLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetRoleState extends HomeState {
  int role;

  GetRoleState({required this.role});
  @override
  List<Object> get props => [];
}

class GetAllMedicinesSuccessState extends HomeState {
  List<Medicine> medicines;
  GetAllMedicinesSuccessState({required this.medicines});
  @override
  List<Object> get props => [];
}

class GetAllMedicinesErrorState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllMedicinesByCatLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllMedicinesByCatSuccessState extends HomeState {
  List<Medicine> medicines;
  GetAllMedicinesByCatSuccessState({required this.medicines});
  @override
  List<Object> get props => [];
}

class GetAllMedicinesByCatErrorState extends HomeState {
  @override
  List<Object> get props => [];
}

class UpdateMedecineLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class UpdateMedecineSuccessState extends HomeState {
  UpdateMedecineSuccessState();
  @override
  List<Object> get props => [];
}

class UpdateMedecineErrorState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllCategoriesLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetAllCategoriesSuccessState extends HomeState {
  List<Category> categories;
  GetAllCategoriesSuccessState({required this.categories});
  @override
  List<Object> get props => [];
}

class GetAllCategoriesErrorState extends HomeState {
  GetAllCategoriesErrorState();
  @override
  List<Object> get props => [];
}
