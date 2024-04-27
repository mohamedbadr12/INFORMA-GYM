import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmr_state.dart';

class BmrCubit extends Cubit<BmrState> {
  BmrCubit() : super(BmrInitial());

  int bmi = 16;
  int weight = 50;
  int height = 150;

  double? _bmr;

  String calculateBMR() {
    _bmr = (1 - (bmi / 100)) * weight;
    _bmr = _bmr! * 21.6;
    _bmr = _bmr! + 370;

    return _bmr!.toStringAsFixed(0);
  }

  String getResult() {
    if (_bmr! >= 25) {
      return '';
    } else if (_bmr! > 20) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmr! >= 25) {
      return '';
    } else if (_bmr! >= 20) {
      return 'GOOD JOB';
    } else {
      return 'EAT EAT EAT';
    }
  }
}
