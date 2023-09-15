import 'package:equatable/equatable.dart';
import 'listhomeaddress_item_model.dart';

// ignore: must_be_immutable
class ProfileAddressDetailsModel extends Equatable {
  ProfileAddressDetailsModel({this.listhomeaddressItemList = const []});

  List<ListhomeaddressItemModel> listhomeaddressItemList;

  ProfileAddressDetailsModel copyWith(
      {List<ListhomeaddressItemModel>? listhomeaddressItemList}) {
    return ProfileAddressDetailsModel(
      listhomeaddressItemList:
          listhomeaddressItemList ?? this.listhomeaddressItemList,
    );
  }

  @override
  List<Object?> get props => [listhomeaddressItemList];
}
