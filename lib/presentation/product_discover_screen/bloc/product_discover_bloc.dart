import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/list_item_model.dart';
import 'package:dilkara/presentation/product_discover_screen/models/product_discover_model.dart';
part 'product_discover_event.dart';
part 'product_discover_state.dart';

class ProductDiscoverBloc
    extends Bloc<ProductDiscoverEvent, ProductDiscoverState> {
  ProductDiscoverBloc(ProductDiscoverState initialState) : super(initialState) {
    on<ProductDiscoverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProductDiscoverInitialEvent event,
    Emitter<ProductDiscoverState> emit,
  ) async {
    emit(state.copyWith(
        productDiscoverModelObj: state.productDiscoverModelObj
            ?.copyWith(listItemList: fillListItemList())));
  }

  List<ListItemModel> fillListItemList() {
    return List.generate(4, (index) => ListItemModel());
  }
}
