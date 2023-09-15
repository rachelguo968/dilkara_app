// ignore_for_file: must_be_immutable

part of 'product_search_bloc.dart';

class ProductSearchState extends Equatable {
  ProductSearchState({
    this.group5609Controller,
    this.productSearchModelObj,
  });

  TextEditingController? group5609Controller;

  ProductSearchModel? productSearchModelObj;

  @override
  List<Object?> get props => [
        group5609Controller,
        productSearchModelObj,
      ];
  ProductSearchState copyWith({
    TextEditingController? group5609Controller,
    ProductSearchModel? productSearchModelObj,
  }) {
    return ProductSearchState(
      group5609Controller: group5609Controller ?? this.group5609Controller,
      productSearchModelObj:
          productSearchModelObj ?? this.productSearchModelObj,
    );
  }
}
