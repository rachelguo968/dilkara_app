import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dilkara/presentation/profile_profile_info_tab_container_screen/models/profile_profile_info_tab_container_model.dart';
part 'profile_profile_info_tab_container_event.dart';
part 'profile_profile_info_tab_container_state.dart';

class ProfileProfileInfoTabContainerBloc extends Bloc<
    ProfileProfileInfoTabContainerEvent, ProfileProfileInfoTabContainerState> {
  ProfileProfileInfoTabContainerBloc(
      ProfileProfileInfoTabContainerState initialState)
      : super(initialState) {
    on<ProfileProfileInfoTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileProfileInfoTabContainerInitialEvent event,
    Emitter<ProfileProfileInfoTabContainerState> emit,
  ) async {}
}
