class GetAllCategoriesSuccessRes {
  List<GetCategorySuccessRes> categories;

  GetAllCategoriesSuccessRes({required this.categories});
  factory GetAllCategoriesSuccessRes.fromJson(dynamic json) {
    return GetAllCategoriesSuccessRes(
        categories: List<GetCategorySuccessRes>.from(
            (json['categories'] as List<dynamic>)
                .map((e) => GetCategorySuccessRes.fromJson(e))).toList());
  }
}

class GetCategorySuccessRes {
  int? idCategory;
  String? nomCat;
  int? total;
  GetCategorySuccessRes({this.idCategory, this.nomCat, this.total});

  factory GetCategorySuccessRes.fromJson(dynamic json) {
    return GetCategorySuccessRes(
        idCategory: json['idcategory'] as int,
        nomCat: json['nom_cat'] as String,
        total: json['nb_med'] as int);
  }
}

class GetCategoryErrorRes {
  GetCategoryErrorRes();

  factory GetCategoryErrorRes.fromJson(dynamic json) {
    return GetCategoryErrorRes();
  }
}
