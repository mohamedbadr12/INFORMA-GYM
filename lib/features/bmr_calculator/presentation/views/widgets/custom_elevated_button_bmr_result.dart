import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomElevatedButtonBmrResult extends StatelessWidget {
  const CustomElevatedButtonBmrResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: kSecondaryColor,
            minimumSize: const Size(double.infinity, 50)),
        child: Text(
          "Re-calculate".toUpperCase(),
          style: Styles.textStyle20(context),
        ),
      ),
    );
  }
}
