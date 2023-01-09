import 'dart:ffi';

class SigninBodyReq {
  String? password;
  String? email;

  SigninBodyReq({this.email, this.password});
  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "username": email,
    };
  }
}

class SignupBodyReq {
  String? password;
  String? username;

  SignupBodyReq({this.username, this.password});
  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "username": username,
    };
  }
}

class SignInSuccessRes {
  String? username;
  int? role;

  SignInSuccessRes({
    this.username,
    this.role,
  });
  factory SignInSuccessRes.fromJson(dynamic json) {
    return SignInSuccessRes(
      username: json['username'] as String,
      role: json['role'] as int,
    );
  }
}

class SignInErrorRes {
  SignInErrorRes();
  factory SignInErrorRes.fromJson(dynamic json) {
    return SignInErrorRes();
  }
}

class SignUpSuccessRes {
  SignUpSuccessRes();
  factory SignUpSuccessRes.fromJson(dynamic json) {
    return SignUpSuccessRes();
  }
}

class SignUpErrorRes {
  SignUpErrorRes();
  factory SignUpErrorRes.fromJson(dynamic json) {
    return SignUpErrorRes();
  }
}
