import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listprice1_item_model.dart';
import 'package:dilkara/presentation/profile_my_orders_page/models/profile_my_orders_model.dart';
part 'profile_my_orders_event.dart';
part 'profile_my_orders_state.dart';

class ProfileMyOrdersBloc
    extends Bloc<ProfileMyOrdersEvent, ProfileMyOrdersState> {
  ProfileMyOrdersBloc(ProfileMyOrdersState initialState) : super(initialState) {
    on<ProfileMyOrdersInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileMyOrdersInitialEvent event,
    Emitter<ProfileMyOrdersState> emit,
  ) async {
    emit(state.copyWith(
        profileMyOrdersModelObj: state.profileMyOrdersModelObj?.copyWith(
      listprice1ItemList: fillListprice1ItemList(),
    )));
  }

  List<Listprice1ItemModel> fillListprice1ItemList() {
    return List.generate(2, (index) => Listprice1ItemModel());
  }
}
