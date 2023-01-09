import 'package:dweya_app/data/models/auth_models.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class SigninLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class UserSuccessfullySingnedInState extends AuthState {
  SignInSuccessRes signInSuccessRes;

  UserSuccessfullySingnedInState({required this.signInSuccessRes});
  @override
  List<Object> get props => [];
}

class AdminSuccessfullySingnedInState extends AuthState {
  @override
  List<Object> get props => [];
}

class WrongCredentialState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorSignInState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignupLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class UserSuccessfullySignedUpState extends AuthState {
  UserSuccessfullySignedUpState();
  @override
  List<Object> get props => [];
}

class ErrorSignupState extends AuthState {
  @override
  List<Object> get props => [];
}
