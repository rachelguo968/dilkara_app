// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  LoginState({
    this.group5614Controller,
    this.group5616Controller,
    this.isShowPassword = true,
    this.loginModelObj,
  });

  TextEditingController? group5614Controller;

  TextEditingController? group5616Controller;

  LoginModel? loginModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        group5614Controller,
        group5616Controller,
        isShowPassword,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? group5614Controller,
    TextEditingController? group5616Controller,
    bool? isShowPassword,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      group5614Controller: group5614Controller ?? this.group5614Controller,
      group5616Controller: group5616Controller ?? this.group5616Controller,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
