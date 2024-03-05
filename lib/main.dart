import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/core/utils/app_router.dart';
import 'package:informa3/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:informa3/features/exercise/data/repo/exercise_repo_implementation.dart';
import 'package:informa3/features/exercise/presentation/manger/workout_cubit/workout_cubit.dart';
import 'features/exercise/data/data_source/exercise/raw_exercise.dart';
import 'features/exercise/presentation/manger/exercise_cubit/excerise_cubit.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('===============User is currently signed out!=================');
      } else {
        print('===============User is signed in!=================');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_ , child) {
      return  MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => WorkoutCubit(),),
        BlocProvider(create: (context) => ExceriseCubit(homeExerciseRepo: HomeExerciseImp(ExerciseRequest())),),

      ],
        child: MaterialApp(
          // routerConfig: AppRouter.router,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute:(FirebaseAuth.instance.currentUser!=null&&FirebaseAuth.instance.currentUser!.emailVerified)?
           "/page1": "/",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
            pageTransitionsTheme: const PageTransitionsTheme(builders:{
              TargetPlatform.android:OpenUpwardsPageTransitionsBuilder()

            } ),
            scaffoldBackgroundColor: kPrimaryColor
          ),

        ),
      );

    }
    );
  }
}

