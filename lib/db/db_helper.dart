import 'package:emp_info/db/lite_db.dart';
import 'package:emp_info/models/emp_model.dart';

class DbHelper extends LiteDb{
  getAllEmp()async{
    List<Employee>emp=[];
    String sqlTxt='SELECT * FROM EMPLOYEE';
    List <Map>myMap=await inquery(sqlTxt);
    for(var i=0;i<myMap.length;i++){
      emp.add(Employee.fromMap(myMap[i]));
    }
    return emp;


  }
  insertNewEmployee(Employee emp)async{
    String sqlTxt = '''
    INSERT INTO EMPLOYEE (name,salary,gender,status,hiring,position,phone)
    VALUES ('${emp.name}',${emp.salary},'${emp.gender}','${emp.status}','${emp.hiringDate}','${emp.position}','${emp.phone}');
    ''';
    int result=await insert(sqlTxt);
    print('insert sucess');
    return result;

  }
  updateEmployee(Employee emp)async{
    String sqlTxt = '''
    UPDATE EMPLOYEE SET
    name='${emp.name}',
    salary=${emp.salary},
    gender='${emp.gender}',
    status='${emp.status}',
    hiring='${emp.hiringDate}',
    position='${emp.position}',
    phone='${emp.phone}'
    WHERE id=${emp.id};
    ''';
    int result=await update(sqlTxt);
    return result;

  }
  deleteEmployee(Employee emp)async{
    String sqlTxt = '''DELETE FROM EMPLOYEE 
    WHERE id=${emp.id}''';
    int result=await delete(sqlTxt);
    return result;
  }

}