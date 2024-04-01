import 'package:flutter/material.dart';

import 'custom_column_sign_up.dart';

class CustomContainerSignUp extends StatelessWidget {
  const CustomContainerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff100B20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: const CustomColumnSignUP(),
    );
  }
}
