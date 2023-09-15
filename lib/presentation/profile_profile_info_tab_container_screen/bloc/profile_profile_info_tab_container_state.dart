// ignore_for_file: must_be_immutable

part of 'profile_profile_info_tab_container_bloc.dart';

class ProfileProfileInfoTabContainerState extends Equatable {
  ProfileProfileInfoTabContainerState(
      {this.profileProfileInfoTabContainerModelObj});

  ProfileProfileInfoTabContainerModel? profileProfileInfoTabContainerModelObj;

  @override
  List<Object?> get props => [
        profileProfileInfoTabContainerModelObj,
      ];
  ProfileProfileInfoTabContainerState copyWith(
      {ProfileProfileInfoTabContainerModel?
          profileProfileInfoTabContainerModelObj}) {
    return ProfileProfileInfoTabContainerState(
      profileProfileInfoTabContainerModelObj:
          profileProfileInfoTabContainerModelObj ??
              this.profileProfileInfoTabContainerModelObj,
    );
  }
}
