// ignore_for_file: must_be_immutable

part of 'main_landing_bloc.dart';

class MainLandingState extends Equatable {
  MainLandingState({
    this.groupThreeController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.mainLandingModelObj,
  });

  TextEditingController? groupThreeController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  MainLandingModel? mainLandingModelObj;

  @override
  List<Object?> get props => [
        groupThreeController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        mainLandingModelObj,
      ];
  MainLandingState copyWith({
    TextEditingController? groupThreeController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    MainLandingModel? mainLandingModelObj,
  }) {
    return MainLandingState(
      groupThreeController: groupThreeController ?? this.groupThreeController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      mainLandingModelObj: mainLandingModelObj ?? this.mainLandingModelObj,
    );
  }
}
