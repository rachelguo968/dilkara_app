// ignore_for_file: must_be_immutable

part of 'product_discover_bloc.dart';

@immutable
abstract class ProductDiscoverEvent extends Equatable {}

class ProductDiscoverInitialEvent extends ProductDiscoverEvent {
  @override
  List<Object?> get props => [];
}
