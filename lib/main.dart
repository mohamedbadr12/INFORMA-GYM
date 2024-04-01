import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/core/utils/app_router.dart';
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
  runApp(DevicePreview(enabled: true,
    builder: (context) => const MyApp(),
    ));
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
     return MultiBlocProvider(providers: [
       BlocProvider(create: (context) => WorkoutCubit(),),
       BlocProvider(create: (context) => ExerciseCubit(homeExerciseRepo: HomeExerciseImp(ExerciseRequest())),),
     ],
       child: MaterialApp(
         locale: DevicePreview.locale(context),
         builder: DevicePreview.appBuilder,
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
}

