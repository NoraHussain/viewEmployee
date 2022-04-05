part of 'employees_cubit.dart';

@immutable
abstract class EmployeesState {}

class EmployeesInitial extends EmployeesState {}

class EmployeesLoaded extends EmployeesState{
  final List<Employee> employee;

  EmployeesLoaded(this.employee);
}

