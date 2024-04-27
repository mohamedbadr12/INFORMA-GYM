import 'package:flutter/material.dart';
import 'package:informa3/constant.dart';
import '../../../../../core/utils/styles.dart';
import 'card.dart';

class BmiViewResultBody extends StatelessWidget {
  const BmiViewResultBody(
      {super.key,
      required this.bmi,
      required this.result,
      required this.feedback});

  final String? bmi;
  final String? result;
  final String? feedback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CardR(
              color: const Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    bmi.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.white60),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      feedback.toString(),
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 17),
                    ),
                  )
                ],
              ),
              onPress: () {}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                backgroundColor: kSecondaryColor,
                minimumSize: const Size(double.infinity, 50)),
            child: Text(
              "Re-calculate".toUpperCase(),
              style: Styles.textStyle20(context),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
