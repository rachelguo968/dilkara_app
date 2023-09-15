// ignore_for_file: must_be_immutable

part of 'product_discover_bloc.dart';

class ProductDiscoverState extends Equatable {
  ProductDiscoverState({this.productDiscoverModelObj});

  ProductDiscoverModel? productDiscoverModelObj;

  @override
  List<Object?> get props => [
        productDiscoverModelObj,
      ];
  ProductDiscoverState copyWith(
      {ProductDiscoverModel? productDiscoverModelObj}) {
    return ProductDiscoverState(
      productDiscoverModelObj:
          productDiscoverModelObj ?? this.productDiscoverModelObj,
    );
  }
}
