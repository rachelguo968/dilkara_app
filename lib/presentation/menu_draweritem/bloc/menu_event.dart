// ignore_for_file: must_be_immutable

part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent extends Equatable {}

class MenuInitialEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}
