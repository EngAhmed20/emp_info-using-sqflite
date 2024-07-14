import 'package:emp_info/db/db_helper.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/emp_model.dart';
part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  static EmployeeCubit get(context)=>BlocProvider.of(context);
  EmployeeCubit(this.dbHelper) : super(EmployeeInitial());
  DbHelper dbHelper;
  List<Employee>emp=[];
  void getAllData()async{
    emit(EmployeeLoading());
    emp =await dbHelper.getAllEmp();
    emit(EmployeeGetAllDataSucess());

  }
  Future<void> addEmp(Employee emp)async{
    emit(EmployeeLoading());
   await dbHelper.insertNewEmployee(emp);
    getAllData();
    emit(EmployeeInsertSuccess());

  }
  Future<void> updateEmp(Employee employee)async{
    emit(EmployeeLoading());
    await dbHelper.updateEmployee(employee);
    getAllData();
    emit(EmployeeUpdateSuccess());
  }
  Future<void> deleteEmp(Employee employee) async{
    emit(EmployeeLoading());
    await dbHelper.deleteEmployee(employee);
    getAllData();
    emit(EmployeeDeleteSuccess());
  }
}
