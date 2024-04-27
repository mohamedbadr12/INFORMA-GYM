import 'package:flutter/material.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/bmr_view_result_body.dart';

import '../../../../constant.dart';
import '../../../../core/utils/styles.dart';

class BmrViewResult extends StatelessWidget {
  const BmrViewResult(
      {super.key,
      required this.bmrResult,
      required this.resultText,
      required this.interpretation});

  final String bmrResult;

  final String resultText;

  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.arrow_back,
        // ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [kPrimaryColor, kSecondaryColor])),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("BMR CALCULATOR",
            style: Styles.textStyle20(context).copyWith(
              fontWeight: FontWeight.bold,
            )),
      ),
      body: BmrViewResultBody(
          bmrResult: bmrResult,
          resultText: resultText,
          interpretation: interpretation),
    );
  }
}
