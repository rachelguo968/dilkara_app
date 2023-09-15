import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listitemname_item_model.dart';
import '../models/mainlanding_item_model.dart';
import '../models/listprice_item_model.dart';
import 'package:dilkara/presentation/main_landing_screen/models/main_landing_model.dart';
part 'main_landing_event.dart';
part 'main_landing_state.dart';

class MainLandingBloc extends Bloc<MainLandingEvent, MainLandingState> {
  MainLandingBloc(MainLandingState initialState) : super(initialState) {
    on<MainLandingInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
  }


  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
    ));
  }


  List<ListitemnameItemModel> fillListitemnameItemList() {
    return List.generate(3, (index) => ListitemnameItemModel());
  }

  List<MainlandingItemModel> fillMainlandingItemList() {
    return List.generate(6, (index) => MainlandingItemModel());
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<ListpriceItemModel> fillListpriceItemList() {
    return List.generate(3, (index) => ListpriceItemModel());
  }

  _onInitialize(
    MainLandingInitialEvent event,
    Emitter<MainLandingState> emit,
  ) async {
    emit(state.copyWith(
      groupThreeController: TextEditingController(),
    ));
    emit(state.copyWith(
        mainLandingModelObj: state.mainLandingModelObj?.copyWith(
      listitemnameItemList: fillListitemnameItemList(),
      mainlandingItemList: fillMainlandingItemList(),
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
      listpriceItemList: fillListpriceItemList(),
    )));
  }
}
