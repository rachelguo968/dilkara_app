import 'package:equatable/equatable.dart';
import 'sliderrectangleeleven_item_model.dart';

// ignore: must_be_immutable
class ProductPageModel extends Equatable {
  ProductPageModel({this.sliderrectangleelevenItemList = const []});

  List<SliderrectangleelevenItemModel> sliderrectangleelevenItemList;

  ProductPageModel copyWith(
      {List<SliderrectangleelevenItemModel>? sliderrectangleelevenItemList}) {
    return ProductPageModel(
      sliderrectangleelevenItemList:
          sliderrectangleelevenItemList ?? this.sliderrectangleelevenItemList,
    );
  }

  @override
  List<Object?> get props => [sliderrectangleelevenItemList];
}
