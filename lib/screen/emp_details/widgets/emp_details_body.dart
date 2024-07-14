import 'package:emp_info/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_form.dart';
import '../../../models/emp_model.dart';
import '../../home/widgets/add_new_customer.dart';

class EmpDetailsBody extends StatefulWidget {
   EmpDetailsBody({super.key, required this.emp});
     final Employee emp;

  @override
  State<EmpDetailsBody> createState() => _EmpDetailsBodyState();
}

class _EmpDetailsBodyState extends State<EmpDetailsBody> {
  DbHelper dbHelper=DbHelper();
   TextEditingController nameController = TextEditingController();

   TextEditingController phoneController = TextEditingController();

   TextEditingController positionController = TextEditingController();

   TextEditingController salaryController = TextEditingController();

   TextEditingController hiringDate = TextEditingController();

   String? gender;

   String genderTxt = 'gender';

   String? status;

  @override
  Widget build(BuildContext context) {
    nameController.text=widget.emp.name;
    phoneController.text=widget.emp.phone;
    positionController.text=widget.emp.position;
    salaryController.text=widget.emp.salary.toString();
    hiringDate.text=widget.emp.hiringDate;
    gender=widget.emp.gender;
    status=widget.emp.status;
    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          customTextForm(
            controller: nameController,
            title: 'name',
            keyboardType: TextInputType.text,
            prefIcon: Icons.person,
          ),
          const SizedBox(
            height: 10,
          ),
          customTextForm(
            controller: phoneController,
            title: 'phone',
            keyboardType: TextInputType.phone,
            prefIcon: Icons.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          customTextForm(
            controller: positionController,
            title: 'position',
            keyboardType: TextInputType.text,
            prefIcon: Icons.work,
          ),
          const SizedBox(
            height: 10,
          ),
          customTextForm(
            controller: salaryController,
            title: 'salary',
            keyboardType: TextInputType.number,
            prefIcon: Icons.monetization_on,
          ),
          const SizedBox(
            height: 10,
          ),
          customTextForm(
            controller: hiringDate,
            title: 'hiring date',
            //textAlign: TextAlign.center,
            keyboardType: TextInputType.datetime,
            prefIcon: Icons.date_range_outlined,
          ),
          const  SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              DropdownButton(
                  value: gender,
                  iconSize: 30,
                  hint:const  Text(
                    'gender',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text('male'),
                      value: 'male',
                    ),
                    DropdownMenuItem(
                      child: Text('female'),
                      value: 'female',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                      print(gender);
                    });
                  }),
              DropdownButton(
                  value: status,
                  iconSize: 30,
                  hint:const  Text(
                    'status',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text('single'),
                      value: 'single',
                    ),
                    DropdownMenuItem(
                      child: Text('married'),
                      value: 'married',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      status = value as String;
                    });
                  }),

            ],
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: custom_button(text: 'Save changes',backgroundColor: Colors.blue,
                onTap: ()async{
                Employee emp=widget.emp;
                emp.name=nameController.text;
                emp.phone=phoneController.text;
                emp.position=positionController.text;
                emp.salary=double.parse(salaryController.text);
                emp.hiringDate=hiringDate.text;
                emp.gender=gender??'';
                emp.status=status??'';
                await dbHelper.updateEmployee(emp);
                 Navigator.pop(context,true);
                },width: 100,
              ),),
              const  SizedBox(width: 30,),
              Expanded(child: custom_button(text: ' delete',backgroundColor: Colors.red,onTap: ()async{
                await dbHelper.deleteEmployee(widget.emp);
                Navigator.of(context).pop();
              },width: 100,)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );

  }
}
