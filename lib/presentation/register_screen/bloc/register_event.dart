// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class RegisterInitialEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class FacebookAuthEvent extends RegisterEvent {
  FacebookAuthEvent();

  @override
  List<Object?> get props => [];
}

class GoogleAuthEvent extends RegisterEvent {
  GoogleAuthEvent();

  @override
  List<Object?> get props => [];
}
