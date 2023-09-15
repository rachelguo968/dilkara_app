import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/sliderrectangleeleven_item_model.dart';
import 'package:dilkara/presentation/product_page_screen/models/product_page_model.dart';
part 'product_page_event.dart';
part 'product_page_state.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  ProductPageBloc(ProductPageState initialState) : super(initialState) {
    on<ProductPageInitialEvent>(_onInitialize);
  }

  List<SliderrectangleelevenItemModel> fillSliderrectangleelevenItemList() {
    return List.generate(1, (index) => SliderrectangleelevenItemModel());
  }

  _onInitialize(
    ProductPageInitialEvent event,
    Emitter<ProductPageState> emit,
  ) async {
    emit(state.copyWith(silderIndex: 0));
    emit(state.copyWith(
        productPageModelObj: state.productPageModelObj?.copyWith(
            sliderrectangleelevenItemList:
                fillSliderrectangleelevenItemList())));
  }
}
