import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/features/bmi_calculater/presentation/manger/bmi_cubit/bmi_cubit.dart';
import 'package:informa3/features/bmi_calculater/presentation/views/widgets/custom_row_choose_gender.dart';
import 'custom_elevated_button_bmi_bmr.dart';
import 'custom_row_choose_weight_and_height.dart';
import 'custom_slider_choose_height.dart';

enum GenderSelection { male, female }

class BmiViewBody extends StatefulWidget {
  const BmiViewBody({super.key});

  @override
  State<BmiViewBody> createState() => _BmiViewBodyState();
}

class _BmiViewBodyState extends State<BmiViewBody> {
  final inactiveColor = const Color(0xff1d1e33);
  final activeColor = const Color(0x011d1e33);
  GenderSelection? selection;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomRowChooseGender(),
              const CustomSliderChooseHeight(),
              const CustomRowChooseWeightAndHeight(),
              BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: CustomElevatedButtonBmi(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
