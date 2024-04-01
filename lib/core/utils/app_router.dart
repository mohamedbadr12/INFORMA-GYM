import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../features/exercise/presentation/views/gym_exercise_workout_view.dart';
import '../../features/start_page_view/presentation/views/start_page2_view.dart';

abstract class AppRouter{

 static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(create: (context) => AuthCubit(),
                child: const LoginView());
          },
        );
      case '/sign':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(create: (context) => AuthCubit(),
                child: const SignUpView());
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
            final Map argument=settings.arguments as Map;
            return  HomeExerciseWorkoutView(
              image:argument["image"] ,
              title: argument["title"],
              docId:argument["docId"]
            );
          },
        );
      case '/gym_workout':
        return MaterialPageRoute(
          builder: (context) {
            final Map argument=settings.arguments as Map;
            return  GymExerciseWorkoutView(
                title: argument["title"], image: argument["image"], documentID: argument["docId"]);
          },
        );
    }
    return null;
  }
}