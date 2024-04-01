import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/core/widgets/show_snack.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/animated_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../logic/auth_cubit/auth_cubit.dart';
import 'another_login_auth.dart';
import 'new_user_row.dart';

class CustomColumnLogin extends StatefulWidget {
  const CustomColumnLogin({super.key});

  @override
  State<CustomColumnLogin> createState() => _CustomColumnLoginState();
}

class _CustomColumnLoginState extends State<CustomColumnLogin> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
      if (state is AuthLoading) {
        isLoading = true;
      }
      if (state is AuthSccuess) {
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Navigator.pushNamedAndRemoveUntil(context, "/page1", (route) => false);
        }
        isLoading = false;
      }
      if (state is AuthFailure) {
        showSnackBar(context, state.err);
        isLoading = false;
      }
    }, builder: (context, state) {
      return Form(
        key: formState,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const AnimatedTextAuth(
              text: "INFORMA GYM",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Login to your account",
              style: Styles.textStyle14(context)
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
                label: "Email",
                controller: email,
                validator: (val) {
                  if (val == "") {
                    return "This Field is Required";
                  }
                  return null;
                }),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                label: "Password",
                controller: password,
                validator: (val) {
                  if (val == "") {
                    return "This Field is Required";
                  }
                  return null;
                }),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () async {
                  if (email.text == "") {
                    showSnackBar(context, "Please enter your email");
                  } else {
                    showSnackBar(context, "An email send to you");
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text);
                  }
                },
                child: Text(
                  "Forgot password?",
                  style: Styles.textStyle14(context),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    label: "SIGN IN",
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).loginUser(
                            email: email.text, password: password.text);
                      } else {}
                    }),
            const SizedBox(
              height: 30,
            ),
            const AnotherAuthLogin(),
            const SizedBox(
              height: 5,
            ),
            const NewUserRow()
          ],
        ),
      );
    });
  }
}

