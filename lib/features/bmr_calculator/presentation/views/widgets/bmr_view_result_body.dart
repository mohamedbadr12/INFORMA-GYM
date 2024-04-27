import 'package:flutter/material.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/reusable_card.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_elevated_button_bmr_result.dart';

class BmrViewResultBody extends StatelessWidget {
  const BmrViewResultBody(
      {super.key,
      required this.bmrResult,
      required this.resultText,
      required this.interpretation});

  final String bmrResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    // Calculate the BMR
    double baseBMR = double.parse(bmrResult);

    // Define activity multipliers
    double noExercise = 1.25;
    double lightExercise = 1.375;
    double moderateExercise = 1.55;
    double heavyExercise = 1.725;
    double veryHeavyExercise = 1.9;

    // Calculate the BMR for different activity levels
    double bmrNoExercise = baseBMR * noExercise;
    double bmrLightExercise = baseBMR * lightExercise;
    double bmrModerateExercise = baseBMR * moderateExercise;
    double bmrHeavyExercise = baseBMR * heavyExercise;
    double bmrVeryHeavyExercise = baseBMR * veryHeavyExercise;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultText.toUpperCase(),
                  style: Styles.kResultTextStyle22(context),
                ),
                Text(
                  bmrResult,
                  style: Styles.kBMRTextStyle100(context),
                ),
                Text(
                  interpretation,
                  style: Styles.kBodyTextStyle22(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display BMR for different activity levels
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Little to no exercise: ${bmrNoExercise.toInt()}",
                          style: Styles.textStyle20(context)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Light exercise (1-3 days/week): ${bmrLightExercise.toInt()} calories",
                          style: Styles.textStyle20(context)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Moderate exercise (3-5 days/week): ${bmrModerateExercise.toInt()}",
                          style: Styles.textStyle20(context)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Heavy exercise (6-7 days/week): ${bmrHeavyExercise.toInt()}",
                          style: Styles.textStyle20(context)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Very heavy exercise: ${bmrVeryHeavyExercise.toInt()}",
                          style: Styles.textStyle20(context)),
                    ),
                  ],
                )
              ],
            ),
            onPress: () {},
          ),
        ),
        const CustomElevatedButtonBmrResult(),
      ],
    );
  }
}
