import 'dart:convert';
import 'dart:io';

import 'package:dweya_app/data/models/category_models.dart';

class CategoryService {
  Future<dynamic> getAllCategories(String url) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        print(stringData);

        return GetAllCategoriesSuccessRes.fromJson(json.decode(stringData));
      } else {
        return GetCategoryErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }
}
