// ignore_for_file: must_be_immutable

part of 'profile_security_bloc.dart';

class ProfileSecurityState extends Equatable {
  ProfileSecurityState({
    this.group5627Controller,
    this.group5627OneController,
    this.profileSecurityModelObj,
  });

  TextEditingController? group5627Controller;

  TextEditingController? group5627OneController;

  ProfileSecurityModel? profileSecurityModelObj;

  @override
  List<Object?> get props => [
        group5627Controller,
        group5627OneController,
        profileSecurityModelObj,
      ];
  ProfileSecurityState copyWith({
    TextEditingController? group5627Controller,
    TextEditingController? group5627OneController,
    ProfileSecurityModel? profileSecurityModelObj,
  }) {
    return ProfileSecurityState(
      group5627Controller: group5627Controller ?? this.group5627Controller,
      group5627OneController:
          group5627OneController ?? this.group5627OneController,
      profileSecurityModelObj:
          profileSecurityModelObj ?? this.profileSecurityModelObj,
    );
  }
}
