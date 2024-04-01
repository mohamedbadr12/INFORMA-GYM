import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/animated_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/show_snack.dart';
import '../../../logic/auth_cubit/auth_cubit.dart';
import 'already_have_account_row.dart';

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
              "SignUP to your account",
              style: Styles.textStyle14(context)
            ),
            const SizedBox(
              height: 14,
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
            const SizedBox(
              height: 15,
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
            const SizedBox(
              height:15,
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
            const SizedBox(
              height: 45,
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
            const SizedBox(
              height: 8,
            ),
            const AlreadyHaveAccountRow()
          ],
        ),
      );
    });
  }
}

