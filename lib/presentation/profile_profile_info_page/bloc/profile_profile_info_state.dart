// ignore_for_file: must_be_immutable

part of 'profile_profile_info_bloc.dart';

class ProfileProfileInfoState extends Equatable {
  ProfileProfileInfoState({
    this.firstnameOneController,
    this.lastnameOneController,
    this.emailaddressController,
    this.profileProfileInfoModelObj,
  });

  TextEditingController? firstnameOneController;

  TextEditingController? lastnameOneController;

  TextEditingController? emailaddressController;

  ProfileProfileInfoModel? profileProfileInfoModelObj;

  @override
  List<Object?> get props => [
        firstnameOneController,
        lastnameOneController,
        emailaddressController,
        profileProfileInfoModelObj,
      ];
  ProfileProfileInfoState copyWith({
    TextEditingController? firstnameOneController,
    TextEditingController? lastnameOneController,
    TextEditingController? emailaddressController,
    ProfileProfileInfoModel? profileProfileInfoModelObj,
  }) {
    return ProfileProfileInfoState(
      firstnameOneController:
          firstnameOneController ?? this.firstnameOneController,
      lastnameOneController:
          lastnameOneController ?? this.lastnameOneController,
      emailaddressController:
          emailaddressController ?? this.emailaddressController,
      profileProfileInfoModelObj:
          profileProfileInfoModelObj ?? this.profileProfileInfoModelObj,
    );
  }
}
