import 'package:flutter/material.dart';

import '../../db/db_helper.dart';
import '../../models/emp_model.dart';
import 'widgets/add_new_customer.dart';
import 'widgets/home_list_item.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
   List <Employee>? empList;
   DbHelper dbHelper=DbHelper();
   void updateList()async{
   empList =await dbHelper.getAllEmp();
   setState(() {
   });
  }
  @override
  void initState() {
    super.initState();
    updateList();
  }
  @override
  Widget build(BuildContext context) {
    if (empList==null)
    {
      empList=[];
      updateList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees Info'),
        elevation: 0,

        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: home_list_view(emp:empList!,),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          isScrollControlled:true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            context: context, builder:(context){
          return addNewCustomer();
        });
      },
        child: Icon(Icons.add,),

      ),
    );
  }
}

class home_list_view extends StatelessWidget {
   home_list_view({
    super.key,required this.emp
  });
    List<Employee> emp;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
     return Padding(
       padding: const EdgeInsets.only(bottom: 10),
       child: HomeListItem(emp: emp[index],),
     );
    },itemCount: emp.length,);
  }
}
