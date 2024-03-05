import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/show_snack.dart';
import 'animated_text.dart';

class CustomColumnSignUP extends StatefulWidget {
  const CustomColumnSignUP({super.key});

  @override
  State<CustomColumnSignUP> createState() => _CustomColumnSignUPState();
}

class _CustomColumnSignUPState extends State<CustomColumnSignUP> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is SignUPLoading) {
        isLoading = true;
      }
      if (state is SignUPSccuess) {
        showSnackBar(context, "please verify your email");
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);

        isLoading = false;
      }
      if (state is SignUPFailure) {
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
              text: "Welcome",
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "SignUP to your account",
              style: Styles.textStyle14.copyWith(color: Colors.white60),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomTextFormField(
              label: "Name",
              controller: name,
              validator: (val) {
                if (val == "") {
                  return "This Field is Required";
                }
                return null;
              },
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
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomTextFormField(
              label: "Password",
              controller: password,
              validator: (val) {
                if (val == "") {
                  return "This Field is Required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    label: "SIGN UP",
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).addUser(name: name.text, email: email.text);
                        BlocProvider.of<AuthCubit>(context).createUserAuth(
                            email: email.text, password: password.text);

                      } else {}
                    },
                  ),
            SizedBox(
              height: 8.h,
            ),
            Row(
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
            )
          ],
        ),
      );
    });
  }
}
