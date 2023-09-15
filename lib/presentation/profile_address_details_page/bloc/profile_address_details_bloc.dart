import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listhomeaddress_item_model.dart';
import 'package:dilkara/presentation/profile_address_details_page/models/profile_address_details_model.dart';
part 'profile_address_details_event.dart';
part 'profile_address_details_state.dart';

class ProfileAddressDetailsBloc
    extends Bloc<ProfileAddressDetailsEvent, ProfileAddressDetailsState> {
  ProfileAddressDetailsBloc(ProfileAddressDetailsState initialState)
      : super(initialState) {
    on<ProfileAddressDetailsInitialEvent>(_onInitialize);
  }

  List<ListhomeaddressItemModel> fillListhomeaddressItemList() {
    return List.generate(2, (index) => ListhomeaddressItemModel());
  }

  _onInitialize(
    ProfileAddressDetailsInitialEvent event,
    Emitter<ProfileAddressDetailsState> emit,
  ) async {
    emit(state.copyWith(
      group5627Controller: TextEditingController(),
      group5627OneController: TextEditingController(),
      group5627TwoController: TextEditingController(),
      group5627ThreeController: TextEditingController(),
      group5627FourController: TextEditingController(),
    ));
    emit(state.copyWith(
        profileAddressDetailsModelObj:
            state.profileAddressDetailsModelObj?.copyWith(
      listhomeaddressItemList: fillListhomeaddressItemList(),
    )));
  }
}
