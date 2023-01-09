import 'package:dweya_app/cubit/auth/auth_state.dart';
import 'package:dweya_app/data/models/auth_models.dart';
import 'package:dweya_app/data/services/auth_service.dart';
import 'package:dweya_app/utils/koko_consts.dart';
import 'package:dweya_app/utils/navigator_service.dart';
import 'package:dweya_app/view/login_screen/login_screen.dart';
import 'package:dweya_app/view/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  late AuthService authService;

  AuthCubit() : super(AuthInitialState()) {
    this.authService = AuthService();
  }

  void loginUser(String email, String password) async {
    try {
      emit(SigninLoadingState());

      var signinBodyReq = SigninBodyReq(
        email: email,
        password: password,
      );

      final signinResponse = await authService.loginUser(
          "${KOKOConst.host}${KOKOConst.loginUrl}", signinBodyReq);

      if (signinResponse is SignInSuccessRes) {
        NavigatorService.instance.navigateTo(OnBoardingScreen());

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', signinResponse.username ?? "");
        await prefs.setInt('role', signinResponse.role ?? 0);

        emit(UserSuccessfullySingnedInState(signInSuccessRes: signinResponse));
      } else if (signinResponse is SignInErrorRes) {
        emit(ErrorSignInState());
      }
    } catch (e) {
      emit(ErrorSignInState());
    }
  }

  void register(String email, String password) async {
    try {
      emit(SignupLoadingState());

      var signupBodyReq = SignupBodyReq(
        username: email,
        password: password,
      );

      final signupResponse = await authService.registerUser(
          "${KOKOConst.host}${KOKOConst.registerUrl}", signupBodyReq);
      if (signupResponse is SignUpSuccessRes) {
        NavigatorService.instance.navigateTo(LoginScreen());
        emit(UserSuccessfullySignedUpState());
      } else if (signupResponse is SignUpErrorRes) {
        emit(ErrorSignupState());
      }
    } catch (e) {
      emit(ErrorSignupState());
    }
  }
}
