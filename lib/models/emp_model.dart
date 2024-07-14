class Employee{
  int id;
  String name ;
  String phone;
  double salary;
  String hiringDate;
  String position;
  String status;
  String gender;
  Employee({required this.id,required this.name,required this.phone,required this.salary,
  required this.status,required this.gender,required this.hiringDate,required this.position
  });

  factory Employee.fromMap(Map<dynamic,dynamic>map)
  {
   return Employee(
     id: map['id']??0,
     name: map['name']??'',
     phone: map['phone']??'',
     salary: map['salary']??0,
     status: map['status']??'',
     gender: map['gender']??'',
     hiringDate: map['hiring']??'',
     position: map['position']??''
   );
  }
  factory Employee.getNewEmpty(){
    return Employee(id: 0, name: '', phone: '', salary: 0, status: '', gender: '', hiringDate: '', position: '');
  }

}