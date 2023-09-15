import 'package:equatable/equatable.dart';
import 'list_item_model.dart';

// ignore: must_be_immutable
class ProductDiscoverModel extends Equatable {
  ProductDiscoverModel({this.listItemList = const []});

  List<ListItemModel> listItemList;

  ProductDiscoverModel copyWith({List<ListItemModel>? listItemList}) {
    return ProductDiscoverModel(
      listItemList: listItemList ?? this.listItemList,
    );
  }

  @override
  List<Object?> get props => [listItemList];
}
