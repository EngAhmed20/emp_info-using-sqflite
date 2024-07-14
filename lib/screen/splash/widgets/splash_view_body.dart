import 'package:emp_info/screen/home/home_scr.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    goNext();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Assets.imgSplashLogo,),
            AnimatedBuilder(animation: slidingAnimation, builder:
            (context,_){
              return SlideTransition(position: slidingAnimation,
              child:  Text('اجعل تعاملاتك اسهل',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),);
            }
            ),

          ],

        ),
      ),
    );
  }
  void initSlidingAnimation(){
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin: Offset(0,8),end: Offset.zero).animate(animationController);
    animationController.forward();
  }
  void goNext(){
    Future.delayed(const Duration(seconds: 3),()
    {
      Navigator.pushReplacementNamed(context, HomeScr.routeName);
    });
  }
}
