import 'package:emp_info/models/emp_model.dart';
import 'package:emp_info/screen/emp_details/emp_details.dart';
import 'package:emp_info/screen/home/home_scr.dart';
import 'package:emp_info/screen/splash/splash_scr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic>OnGenerateRoute(RouteSettings settings)
{
  switch(settings.name)
      {
    case SplashScr.routeName:
        return MaterialPageRoute(builder: (_) => SplashScr());
    case HomeScr.routeName:
      return MaterialPageRoute(builder: (_) => HomeScr());
    case EmpDetails.routeName:
      return MaterialPageRoute(builder: (_) => EmpDetails(emp: settings.arguments as Employee,));
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());

  }
}