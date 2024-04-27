import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/features/bmi_calculater/presentation/views/bmi_view_result.dart';
import 'package:informa3/features/bmr_calculator/presentation/manger/bmr_cubit/bmr_cubit.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/bmr_result.dart';

import 'package:informa3/features/exercise/presentation/views/choose_workout_view.dart';
import 'package:informa3/features/exercise/presentation/views/gym_exercise_view.dart';
import 'package:informa3/features/exercise/presentation/views/home_exercise_view.dart';
import 'package:informa3/features/exercise/presentation/views/home_exercise_workout_view.dart';
import 'package:informa3/features/home_view/presentation/views/home_view.dart';
import 'package:informa3/features/start_page_view/presentation/views/start_page1_view.dart';
import 'package:informa3/features/start_page_view/presentation/views/start_page3_view.dart';

import '../../features/auth/logic/auth_cubit/auth_cubit.dart';
import '../../features/auth/ui/views/login_view.dart';
import '../../features/auth/ui/views/sign_up_view.dart';
import '../../features/bmi_calculater/presentation/manger/bmi_cubit/bmi_cubit.dart';
import '../../features/bmi_calculater/presentation/views/bmi_view.dart';
import '../../features/bmr_calculator/presentation/views/bmr_view.dart';
import '../../features/exercise/presentation/views/gym_exercise_workout_view.dart';
import '../../features/exercise/presentation/views/home_exercise_workout_item_view.dart';
import '../../features/start_page_view/presentation/views/start_page2_view.dart';

abstract class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
                create: (context) => AuthCubit(), child: const LoginView());
          },
        );
      case '/sign':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
                create: (context) => AuthCubit(), child: const SignUpView());
          },
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );
      case '/page1':
        return MaterialPageRoute(
          builder: (context) {
            return const StartPage1View();
          },
        );
      case '/page2':
        return MaterialPageRoute(
          builder: (context) {
            return const StartPage2View();
          },
        );
      case '/page3':
        return MaterialPageRoute(
          builder: (context) {
            return const StartPage3View();
          },
        );
      case '/exercise':
        return MaterialPageRoute(
          builder: (context) {
            return const HomeExerciseView();
          },
        );
      case '/gym_exercise':
        return MaterialPageRoute(
          builder: (context) {
            return const GymExerciseView();
          },
        );
      case '/choose_exercise':
        return MaterialPageRoute(
          builder: (context) {
            return const ChooseWorkoutView();
          },
        );
      case '/home_workout':
        return MaterialPageRoute(
          builder: (context) {
            final Map argument = settings.arguments as Map;
            return HomeExerciseWorkoutView(
              image: argument["image"],
              title: argument["title"],
              docId: argument["docId"],
            );
          },
        );
      case '/gym_workout':
        return MaterialPageRoute(
          builder: (context) {
            final Map argument = settings.arguments as Map;
            return GymExerciseWorkoutView(
                title: argument["title"],
                image: argument["image"],
                documentID: argument["docId"]);
          },
        );
      case '/home_workout_item':
        return MaterialPageRoute(
          builder: (context) {
            final Map argument = settings.arguments as Map;
            return HomeExerciseWorkoutItemView(
              image: argument["image"],
              title: argument["title"],
              des: argument["des"],
              id: argument["id"],
            );
          },
        );
      case '/bmi_result':
        return MaterialPageRoute(
          builder: (context) {
            final Map argument = settings.arguments as Map;
            return BlocProvider(
              create: (context) => BmiCubit(),
              child: BmiViewResult(
                result: argument["result"],
                feedback: argument["feedback"],
                bmi: argument["bmi"],
              ),
            );
          },
        );
      case '/bmi_view':
        return MaterialPageRoute(
          builder: (context) {
            return const BmiView();
          },
        );
      case '/bmr_view':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
                create: (context) => BmrCubit(), child: const BmrView());
          },
        );
      case '/bmr_result':
        return MaterialPageRoute(builder: (context) {
          final Map argument = settings.arguments as Map;
          return BlocProvider(
            create: (context) => BmrCubit(),
            child: BmrViewResult(
              bmrResult: argument["bmr"],
              resultText: argument["result"],
              interpretation: argument["interpretation"],
            ),
          );
        });
    }
    return null;
  }
}
