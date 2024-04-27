import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  int height = 150, weight = 65;

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return "OverWeight";
    } else if (_bmi! > 18.5) {
      return "Normal";
    } else {
      return "underWeight";
    }
  }

  String feedBack() {
    if (_bmi! >= 25) {
      return "You have a higher than normal body weight .\nTry to exercise more.those who are overweight (Bmi of 25 to 29.9).it is recommented that you lose weight ";
    } else if (_bmi! > 18.5) {
      return "you have a normal body weight.Congratulation";
    } else {
      return "Eat more frequently .you are underweight.\nEat may you feel full faster.";
    }
  }
}
