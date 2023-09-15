import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dilkara/presentation/profile_profile_info_page/models/profile_profile_info_model.dart';
part 'profile_profile_info_event.dart';
part 'profile_profile_info_state.dart';

class ProfileProfileInfoBloc
    extends Bloc<ProfileProfileInfoEvent, ProfileProfileInfoState> {
  ProfileProfileInfoBloc(ProfileProfileInfoState initialState)
      : super(initialState) {
    on<ProfileProfileInfoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileProfileInfoInitialEvent event,
    Emitter<ProfileProfileInfoState> emit,
  ) async {
    emit(state.copyWith(
      firstnameOneController: TextEditingController(),
      lastnameOneController: TextEditingController(),
      emailaddressController: TextEditingController(),
    ));
  }
}
