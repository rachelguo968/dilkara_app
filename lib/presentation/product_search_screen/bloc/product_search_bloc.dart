import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/list1_item_model.dart';
import 'package:dilkara/presentation/product_search_screen/models/product_search_model.dart';
part 'product_search_event.dart';
part 'product_search_state.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc(ProductSearchState initialState) : super(initialState) {
    on<ProductSearchInitialEvent>(_onInitialize);
  }

  List<List1ItemModel> fillList1ItemList() {
    return List.generate(6, (index) => List1ItemModel());
  }

  _onInitialize(
    ProductSearchInitialEvent event,
    Emitter<ProductSearchState> emit,
  ) async {
    emit(state.copyWith(
      group5609Controller: TextEditingController(),
    ));
    emit(state.copyWith(
        productSearchModelObj: state.productSearchModelObj?.copyWith(
      list1ItemList: fillList1ItemList(),
    )));
  }
}
