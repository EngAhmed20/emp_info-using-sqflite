import 'package:emp_info/screen/splash/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashScr extends StatelessWidget {
  const SplashScr({super.key});
  static const routeName = "splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: SplashViewBody()),
    );
  }
}
