import 'package:flutter/material.dart';
import 'package:informa3/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
          child: LoginViewBody()),
    );
  }
}
