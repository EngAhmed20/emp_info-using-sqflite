import 'package:emp_info/models/emp_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/custom_text_form.dart';
import '../../../db/db_helper.dart';

class addNewCustomer extends StatefulWidget {
  addNewCustomer({super.key});

  @override
  State<addNewCustomer> createState() => _addNewCustomerState();
}

class _addNewCustomerState extends State<addNewCustomer> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController positionController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  TextEditingController hiringDate = TextEditingController();
  String? gender;
  String genderTxt = 'gender';
  String? status;
  DbHelper  dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          const Text(
            'Add new employee',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
              Expanded(child: custom_button(text: 'Save',backgroundColor: Colors.blue,
              onTap: ()async{
                Employee emp=Employee.getNewEmpty();
                emp.name=nameController.text;
                emp.phone=phoneController.text;
                emp.position=positionController.text;
                emp.salary=double.parse(salaryController.text);
                emp.hiringDate=hiringDate.text;
                emp.gender=gender??'';
                emp.status=status??'';
                await dbHelper.insertNewEmployee(emp);
                Navigator.pop(context,true);


              },width: 100,
              ),),
             const  SizedBox(width: 30,),
              Expanded(child: custom_button(text: ' cancel',backgroundColor: Colors.red,onTap: (){
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

class custom_button extends StatelessWidget {
  const custom_button({
    super.key, this.onTap, this.backgroundColor, required this.text, this.width
  });
  final void Function()? onTap;
  final Color?backgroundColor;
  final String text;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor??Colors.black,
        ),
        width:width??MediaQuery.of(context).size.width,
        child:  Center (child: Text(text,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)),
      ),
    );
  }
}
