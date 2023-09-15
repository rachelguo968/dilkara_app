// ignore_for_file: must_be_immutable

part of 'profile_profile_info_bloc.dart';

@immutable
abstract class ProfileProfileInfoEvent extends Equatable {}

class ProfileProfileInfoInitialEvent extends ProfileProfileInfoEvent {
  @override
  List<Object?> get props => [];
}
