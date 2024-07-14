import 'package:emp_info/core/helper_fun/on_generate_route.dart';
import 'package:emp_info/db/db_helper.dart';
import 'package:emp_info/screen/splash/splash_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/employee_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeCubit>(
          create: (context) => EmployeeCubit(DbHelper())..getAllData(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: OnGenerateRoute,
        initialRoute: SplashScr.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


