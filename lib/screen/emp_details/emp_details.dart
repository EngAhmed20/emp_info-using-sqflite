import 'package:emp_info/models/emp_model.dart';
import 'package:emp_info/screen/emp_details/widgets/emp_details_body.dart';
import 'package:flutter/material.dart';

class EmpDetails extends StatelessWidget {
  const EmpDetails({super.key, required this.emp});
  static const String routeName='/empDetails';
  final Employee emp;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details: ${emp.name}'),
      ),
      body: EmpDetailsBody(emp: emp,),
    );
  }
}
