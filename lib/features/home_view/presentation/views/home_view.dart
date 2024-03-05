import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/features/exercise/presentation/views/choose_workout_view.dart';
import 'package:informa3/features/exercise/presentation/views/gym_exercise_view.dart';
import 'package:informa3/features/exercise/presentation/views/home_exercise_view.dart';
import 'package:informa3/features/home_view/presentation/views/widgets/build_header_app_bar.dart';
import 'package:informa3/features/home_view/presentation/views/widgets/build_menu_app_bar.dart';
import '../../../../constant.dart';
import '../../../auth/presentation/views/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeExerciseView(),
    const GymExerciseView(),
    const ChooseWorkoutView(),
    const LoginView(),
    const LoginView(),
  ];
  List<Color> color = [];
  void changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const Drawer(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [BuildHeaderAppBar(),  BuildMenuAppBar()],
          ),
        ),
      ),
      appBar: AppBar(flexibleSpace: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [kPrimaryColor,kSecondaryColor])),),

        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: const Text(
          "INFORMA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        // backgroundColor: Colors.white,
        // centerTitle: true,
      ),
      // appBar: AppBar(title: const Text("INFORMA"), actions: [
      //   IconButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         GoogleSignIn google = GoogleSignIn();
      //         google.disconnect();
      //         Navigator.pushNamed(context, "/");
      //       },
      //       icon: const Icon(Icons.exit_to_app))
      // ]),
      // body: const HomeViewBody(),
      body: widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: ConvexAppBar(
        gradient:
            const LinearGradient(colors: [kSecondaryColor, Color(0xff281537)]),
        items: [
          TabItem(
              icon: Icon(
                Icons.home,
                color: Colors.brown.shade100,
              ),
              title: "exercise"),
          TabItem(
              icon: Icon(
                Icons.chat,
                color: Colors.brown.shade100,
              ),
              title: "chat"),
          TabItem(
              icon: Icon(
                Icons.calculate_outlined,
                color: Colors.brown.shade100,
              ),
              title: "Cal"),
          TabItem(
              icon: Icon(
                Icons.health_and_safety,
                color: Colors.brown.shade100,
              ),
              title: "Diet plan"),
          TabItem(
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.brown.shade100,
              ),
              title: "Store"),
        ],
        initialActiveIndex: currentIndex,
        onTap: changeItem,
        height: 45.h,
      ),
    );
  }
}





