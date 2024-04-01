import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/choose_workout_view.dart';
import 'package:informa3/features/exercise/presentation/views/gym_exercise_view.dart';
import 'package:informa3/features/exercise/presentation/views/home_exercise_view.dart';
import 'package:informa3/features/home_view/presentation/views/widgets/build_header_app_bar.dart';
import 'package:informa3/features/home_view/presentation/views/widgets/build_menu_app_bar.dart';
import '../../../../constant.dart';
import '../../../auth/ui/views/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const ChooseWorkoutView(),
    const HomeExerciseView(),
    const GymExerciseView(),
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
      drawer:  Drawer(
        backgroundColor: kSecondaryColor,
           child:Container(
  decoration: const BoxDecoration(gradient: LinearGradient(colors: [kPrimaryColor,kSecondaryColor])),

        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BuildHeaderAppBar(),
              BuildMenuAppBar()
            ],
          ),
        ),
)
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

      ),

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
              title: "Exercise"),
          TabItem(
              icon: Icon(
                Icons.chat,
                color: Colors.brown.shade100,
              ),
              title: "Chat"),
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
        height:50
      ),
    );
  }
}





