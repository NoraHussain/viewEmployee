import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/employees.dart';
import 'package:flutter_breaking/data/repository/employees_repositoory.dart';
import 'package:meta/meta.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> {

  final EmployeesRepository employeesRepository;
  List<Employee> employees =[];

  EmployeesCubit(this.employeesRepository) : super(EmployeesInitial());

  List<Employee> getAllEmployees (){
    employeesRepository.getAllEmployees().then((employees) {
      emit(EmployeesLoaded(employees));//ابدأ
      this.employees = employees;
    });
    return employees;
  }



}












