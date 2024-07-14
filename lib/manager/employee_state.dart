part of 'employee_cubit.dart';

@immutable
abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}
class EmployeeLoading extends EmployeeState {}
class EmployeeGetAllDataSucess extends EmployeeState {}
class EmployeeGetAllDataFailure extends EmployeeState {}
class EmployeeInsertSuccess extends EmployeeState{}
class EmployeeInsertFailure extends EmployeeState {}
class EmployeeUpdateSuccess extends EmployeeState {}
class EmployeeUpdateFailure extends EmployeeState {}
class EmployeeDeleteSuccess extends EmployeeState {}
class EmployeeDeleteFailure extends EmployeeState {}

