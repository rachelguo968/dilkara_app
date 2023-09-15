import 'package:equatable/equatable.dart';
import 'list1_item_model.dart';

// ignore: must_be_immutable
class ProductSearchModel extends Equatable {
  ProductSearchModel({this.list1ItemList = const []});

  List<List1ItemModel> list1ItemList;

  ProductSearchModel copyWith({List<List1ItemModel>? list1ItemList}) {
    return ProductSearchModel(
      list1ItemList: list1ItemList ?? this.list1ItemList,
    );
  }

  @override
  List<Object?> get props => [list1ItemList];
}
