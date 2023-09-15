import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dilkara/presentation/menu_draweritem/models/menu_model.dart';
part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(MenuState initialState) : super(initialState) {
    on<MenuInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MenuInitialEvent event,
    Emitter<MenuState> emit,
  ) async {}
}
