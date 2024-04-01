import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account ?"),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            child: const Text(
              "Sign IN",
              style: TextStyle(color: kSecondaryColor),
            ))
      ],
    );
  }
}
