import 'package:flutter_breaking/data/models/employees.dart';
import 'package:flutter_breaking/data/web_services/characters_webservices.dart';

class EmployeesRepository{

  final EmployeesWebServices employeesWebServices;

  EmployeesRepository(this.employeesWebServices);

  Future <List<Employee>> getAllEmployees() async {
    final employees = await employeesWebServices.getAllEmployee();

    return employees.map((employee) => Employee.fromJson(employee)).toList();

  }


  }