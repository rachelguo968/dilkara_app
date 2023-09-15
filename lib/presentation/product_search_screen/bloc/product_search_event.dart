// ignore_for_file: must_be_immutable

part of 'product_search_bloc.dart';

@immutable
abstract class ProductSearchEvent extends Equatable {}

class ProductSearchInitialEvent extends ProductSearchEvent {
  @override
  List<Object?> get props => [];
}
