import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class NewUserRow extends StatelessWidget {
  const NewUserRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account ? "),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/sign");
            },
            child: const Text("SIGN UP",
                style: TextStyle(color: kSecondaryColor)))
      ],
    );
  }
}
