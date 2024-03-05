import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/widgets/show_snack.dart';
import 'package:informa3/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'animated_text.dart';
import 'another_login_auth.dart';

class CustomColumnAuth extends StatefulWidget {
  const CustomColumnAuth({super.key});

  @override
  State<CustomColumnAuth> createState() => _CustomColumnAuthState();
}

class _CustomColumnAuthState extends State<CustomColumnAuth> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
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
            SizedBox(
              height: 20.h,
            ),
            const AnimatedTextAuth(
              text: "Welcome Back",
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Login to your account",
              style: Styles.textStyle14.copyWith(color: Colors.white60),
            ),
            SizedBox(
              height: 14.h,
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
            SizedBox(
              height: 5.h,
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
                  style: Styles.textStyle14.copyWith(color: Colors.white60),
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
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
            SizedBox(
              height: 15.h,
            ),

            SizedBox(
              height: 7.h,
            ),
            const AnotherAuthLogin(),
            SizedBox(
              height: 5.h,
            ),
            Row(
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
            )
          ],
        ),
      );
    });
  }
}
