class GetAllMedicinesSuccessRes {
  List<GetMedicineSuccessRes> medicines;

  GetAllMedicinesSuccessRes({required this.medicines});
  factory GetAllMedicinesSuccessRes.fromJson(dynamic json) {
    return GetAllMedicinesSuccessRes(
        medicines: List<GetMedicineSuccessRes>.from(
            (json['medicines'] as List<dynamic>)
                .map((e) => GetMedicineSuccessRes.fromJson(e))).toList());
  }
}

class GetMedicineSuccessRes {
  int? idMedicament;
  String? code;
  String? desComm;
  String? desInter;
  String? status;
  String? category;

  GetMedicineSuccessRes(
      {this.idMedicament,
      this.code,
      this.desComm,
      this.desInter,
      this.status,
      this.category});
  factory GetMedicineSuccessRes.fromJson(dynamic json) {
    return GetMedicineSuccessRes(
        idMedicament: json['id_medicament'] as int,
        code: json['code'] as String,
        desComm: json['des_comm'],
        desInter: json['des_inter'],
        category: json['nom_cat'],
        status: json['status']);
  }
}

class GetAllMedicinesErrorRes {}

class UpdateMedecineBodyReq {
  int? id;
  int? status;

  UpdateMedecineBodyReq({this.id, this.status});
  Map<String, dynamic> toJson() {
    return {
      "id_medicament": id,
      "status": status,
    };
  }
}

class UpdateMedicineSuccessRes {
  UpdateMedicineSuccessRes();
  factory UpdateMedicineSuccessRes.fromJson(dynamic json) {
    return UpdateMedicineSuccessRes();
  }
}

class UpdateMedicineErrorRes {
  UpdateMedicineErrorRes();
  factory UpdateMedicineErrorRes.fromJson(dynamic json) {
    return UpdateMedicineErrorRes();
  }
}
