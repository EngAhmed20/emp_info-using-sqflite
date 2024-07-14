import 'package:emp_info/models/emp_model.dart';
import 'package:emp_info/screen/emp_details/emp_details.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, required this.emp});
  final Employee emp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Navigator.pushNamed(context,EmpDetails.routeName,arguments:emp);
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            custom_text(text: emp.name,fontSize: 18,fontWeight: FontWeight.w700,),
            ExpansionTile(
              title: custom_text(text: 'show data',fontSize: 18,fontWeight: FontWeight.w500,),
              leading: Icon(Icons.info),
              children: [
                custom_text(text: 'Position :',fontSize: 16,),
                custom_text(text: emp.position,fontSize: 16,fontWeight: FontWeight.w600,),
                const Divider(
                  height: 15,
                ),
                custom_text(text: 'salary :',fontSize: 16,),
                custom_text(text: emp.salary.toString(),fontSize: 16,fontWeight: FontWeight.w600),
                const Divider(
                  height: 15,
                ),
                custom_text(text: 'phone :',fontSize: 16,),
                custom_text(text: emp.phone.toString(),fontSize: 16,fontWeight: FontWeight.w600),
                const Divider(
                  height: 15,
                ),
                custom_text(text: 'gender :',fontSize: 16,),
                custom_text(text: emp.gender,fontSize: 16,fontWeight: FontWeight.w600),
                const Divider(
                  height: 15,
                ),
                custom_text(text: 'status:',fontSize: 16,),
                custom_text(text: emp.status,fontSize: 16,fontWeight: FontWeight.w600),
                const Divider(
                  height: 15,
                ),
                custom_text(text: 'hiring date :',fontSize: 16,),
                custom_text(text: emp.hiringDate.toString(),fontSize: 16,fontWeight: FontWeight.w600),


              ],
            ),




          ],
        ),
      ),
    );
  }
}

class custom_text extends StatelessWidget {
  const custom_text({
    super.key, this.fontSize, this.fontWeight, required this.text,
  });
  final double? fontSize;
  final FontWeight? fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: fontSize??16,fontWeight: fontWeight??FontWeight.normal),);
  }
}
