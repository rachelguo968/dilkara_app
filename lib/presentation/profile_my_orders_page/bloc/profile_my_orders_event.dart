// ignore_for_file: must_be_immutable

part of 'profile_my_orders_bloc.dart';

@immutable
abstract class ProfileMyOrdersEvent extends Equatable {}

class ProfileMyOrdersInitialEvent extends ProfileMyOrdersEvent {
  @override
  List<Object?> get props => [];
}
