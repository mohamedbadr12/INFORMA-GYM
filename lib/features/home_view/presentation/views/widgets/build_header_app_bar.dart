
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class BuildHeaderAppBar extends StatelessWidget {
  const BuildHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child:  const Column(
        children: [
          CircleAvatar(
            radius: 47,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMwp4g3tm47QIqXsbdPVJLfQ69DnyM8YM85Q&usqp=CAU'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "mohamed",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            "mohamed22@gmail.com",
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }
}