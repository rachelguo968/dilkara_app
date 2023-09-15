// ignore_for_file: must_be_immutable

part of 'profile_security_bloc.dart';

@immutable
abstract class ProfileSecurityEvent extends Equatable {}

class ProfileSecurityInitialEvent extends ProfileSecurityEvent {
  @override
  List<Object?> get props => [];
}
