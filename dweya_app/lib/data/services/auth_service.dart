import 'dart:convert';
import 'dart:io';

import 'package:dweya_app/data/models/auth_models.dart';

class AuthService {
  Future<dynamic> loginUser(String url, data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return SignInSuccessRes.fromJson(json.decode(stringData));
      } else {
        return SignInErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }

  Future<dynamic> registerUser(String url, data) async {
    var httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      if (response.statusCode == 201) {
        //final stringData = await response.transform(utf8.decoder).join();
        return SignUpSuccessRes();
      } else {
        return SignUpErrorRes();
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
  }
}
