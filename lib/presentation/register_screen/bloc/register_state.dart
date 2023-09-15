// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

class RegisterState extends Equatable {
  RegisterState({
    this.firstnameController,
    this.lastnameController,
    this.emailController,
    this.passwordController,
    this.registerModelObj,
  });

  TextEditingController? firstnameController;

  TextEditingController? lastnameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  RegisterModel? registerModelObj;

  @override
  List<Object?> get props => [
        firstnameController,
        lastnameController,
        emailController,
        passwordController,
        registerModelObj,
      ];
  RegisterState copyWith({
    TextEditingController? firstnameController,
    TextEditingController? lastnameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      firstnameController: firstnameController ?? this.firstnameController,
      lastnameController: lastnameController ?? this.lastnameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
