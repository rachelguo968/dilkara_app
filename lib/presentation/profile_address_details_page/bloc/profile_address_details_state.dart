// ignore_for_file: must_be_immutable

part of 'profile_address_details_bloc.dart';

class ProfileAddressDetailsState extends Equatable {
  ProfileAddressDetailsState({
    this.group5627Controller,
    this.group5627OneController,
    this.group5627TwoController,
    this.group5627ThreeController,
    this.group5627FourController,
    this.profileAddressDetailsModelObj,
  });

  TextEditingController? group5627Controller;

  TextEditingController? group5627OneController;

  TextEditingController? group5627TwoController;

  TextEditingController? group5627ThreeController;

  TextEditingController? group5627FourController;

  ProfileAddressDetailsModel? profileAddressDetailsModelObj;

  @override
  List<Object?> get props => [
        group5627Controller,
        group5627OneController,
        group5627TwoController,
        group5627ThreeController,
        group5627FourController,
        profileAddressDetailsModelObj,
      ];
  ProfileAddressDetailsState copyWith({
    TextEditingController? group5627Controller,
    TextEditingController? group5627OneController,
    TextEditingController? group5627TwoController,
    TextEditingController? group5627ThreeController,
    TextEditingController? group5627FourController,
    ProfileAddressDetailsModel? profileAddressDetailsModelObj,
  }) {
    return ProfileAddressDetailsState(
      group5627Controller: group5627Controller ?? this.group5627Controller,
      group5627OneController:
          group5627OneController ?? this.group5627OneController,
      group5627TwoController:
          group5627TwoController ?? this.group5627TwoController,
      group5627ThreeController:
          group5627ThreeController ?? this.group5627ThreeController,
      group5627FourController:
          group5627FourController ?? this.group5627FourController,
      profileAddressDetailsModelObj:
          profileAddressDetailsModelObj ?? this.profileAddressDetailsModelObj,
    );
  }
}
