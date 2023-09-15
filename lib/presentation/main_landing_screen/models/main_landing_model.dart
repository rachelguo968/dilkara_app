import 'package:equatable/equatable.dart';
import 'listitemname_item_model.dart';
import 'mainlanding_item_model.dart';
import 'package:dilkara/data/models/selectionPopupModel/selection_popup_model.dart';
import 'listprice_item_model.dart';

// ignore: must_be_immutable
class MainLandingModel extends Equatable {
  MainLandingModel(
      {this.listitemnameItemList = const [],
      this.mainlandingItemList = const [],
      this.dropdownItemList = const [],
      this.dropdownItemList1 = const [],
      this.dropdownItemList2 = const [],
      this.listpriceItemList = const []});

  List<ListitemnameItemModel> listitemnameItemList;

  List<MainlandingItemModel> mainlandingItemList;

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  List<ListpriceItemModel> listpriceItemList;

  MainLandingModel copyWith(
      {List<ListitemnameItemModel>? listitemnameItemList,
      List<MainlandingItemModel>? mainlandingItemList,
      List<SelectionPopupModel>? dropdownItemList,
      List<SelectionPopupModel>? dropdownItemList1,
      List<SelectionPopupModel>? dropdownItemList2,
      List<ListpriceItemModel>? listpriceItemList}) {
    return MainLandingModel(
      listitemnameItemList: listitemnameItemList ?? this.listitemnameItemList,
      mainlandingItemList: mainlandingItemList ?? this.mainlandingItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      listpriceItemList: listpriceItemList ?? this.listpriceItemList,
    );
  }

  @override
  List<Object?> get props => [
        listitemnameItemList,
        mainlandingItemList,
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        listpriceItemList
      ];
}
