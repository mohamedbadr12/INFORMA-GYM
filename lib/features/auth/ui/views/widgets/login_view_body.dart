import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:informa3/core/utils/assets.dart';
import 'package:informa3/features/auth/ui/views/widgets/custom_column_login.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
        SliverToBoxAdapter(child: SizedBox(height: MediaQuery.sizeOf(context).height*0.35,
            child: Image.asset(AssetsData.loginImage,fit: BoxFit.cover))),
        const SliverToBoxAdapter(child: CustomColumnLogin()),
    ]
    );


  }
}
