import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bmi_calculater/presentation/views/widgets/custom_row_choose_gender.dart';
import '../../manger/bmr_cubit/bmr_cubit.dart';
import 'custom_container_choose_weight_and_bmi.dart';
import 'custom_elevated_button_bmr.dart';
import 'custom_slider_height.dart';

enum Gender {
  male,
  female,
}

class BmrViewBody extends StatefulWidget {
  const BmrViewBody({super.key});

  @override
  State<BmrViewBody> createState() => _BmrViewBodyState();
}

class _BmrViewBodyState extends State<BmrViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomRowChooseGender(),
            const CustomSliderHeight(),
            const CustomContainerChooseWeightAndBmi(),

            BlocBuilder<BmrCubit, BmrState>(
                builder: (context, state) =>
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: CustomElevatedButtonBmr())),
            const SizedBox(height: 20,)

          ],
        ),
      ),
    ]);
  }
}

