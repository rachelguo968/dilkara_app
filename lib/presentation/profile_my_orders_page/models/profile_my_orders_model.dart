import 'package:equatable/equatable.dart';
import 'listprice1_item_model.dart';

// ignore: must_be_immutable
class ProfileMyOrdersModel extends Equatable {
  ProfileMyOrdersModel({this.listprice1ItemList = const []});

  List<Listprice1ItemModel> listprice1ItemList;

  ProfileMyOrdersModel copyWith(
      {List<Listprice1ItemModel>? listprice1ItemList}) {
    return ProfileMyOrdersModel(
      listprice1ItemList: listprice1ItemList ?? this.listprice1ItemList,
    );
  }

  @override
  List<Object?> get props => [listprice1ItemList];
}
