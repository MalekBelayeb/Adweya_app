import 'dart:convert';
import 'dart:io';
import 'package:dweya_app/data/models/medicine_models.dart';

class MedicineService {
  Future<dynamic> getAllMedicines(String url) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        print(stringData);

        return GetAllMedicinesSuccessRes.fromJson(json.decode(stringData));
      } else {
        return GetAllMedicinesErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }

  Future<dynamic> updateMedicine(String url, data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        return UpdateMedicineSuccessRes();
      } else {
        return UpdateMedicineErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }

  Future<dynamic> getAllMedicinesByCategory(String url) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        print(stringData);

        return GetAllMedicinesSuccessRes.fromJson(json.decode(stringData));
      } else {
        return GetAllMedicinesErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }
}
