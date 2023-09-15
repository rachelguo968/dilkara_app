// ignore_for_file: must_be_immutable

part of 'product_page_bloc.dart';

class ProductPageState extends Equatable {
  ProductPageState({
    this.silderIndex = 0,
    this.productPageModelObj,
  });

  ProductPageModel? productPageModelObj;

  int silderIndex;

  @override
  List<Object?> get props => [
        silderIndex,
        productPageModelObj,
      ];
  ProductPageState copyWith({
    int? silderIndex,
    ProductPageModel? productPageModelObj,
  }) {
    return ProductPageState(
      silderIndex: silderIndex ?? this.silderIndex,
      productPageModelObj: productPageModelObj ?? this.productPageModelObj,
    );
  }
}
