// ignore_for_file: must_be_immutable

part of 'product_page_bloc.dart';

@immutable
abstract class ProductPageEvent extends Equatable {}

class ProductPageInitialEvent extends ProductPageEvent {
  @override
  List<Object?> get props => [];
}
