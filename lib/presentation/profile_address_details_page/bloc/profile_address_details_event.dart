// ignore_for_file: must_be_immutable

part of 'profile_address_details_bloc.dart';

@immutable
abstract class ProfileAddressDetailsEvent extends Equatable {}

class ProfileAddressDetailsInitialEvent extends ProfileAddressDetailsEvent {
  @override
  List<Object?> get props => [];
}
