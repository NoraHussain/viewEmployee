import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/employees_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/models/employees.dart';
import 'package:flutter_breaking/data/repository/employees_repositoory.dart';
import 'package:flutter_breaking/presentation/screens/employee_details_screen.dart';
import 'package:flutter_breaking/presentation/screens/employees_screen.dart';

import 'data/web_services/characters_webservices.dart';

class AppRouter {
  late EmployeesRepository employeesRepository;
  late EmployeesCubit employeesCubit;

  AppRouter() {
    employeesRepository = EmployeesRepository(EmployeesWebServices());
    employeesCubit = EmployeesCubit(employeesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case employeesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => employeesCubit,
                child: EmployeesScreen()));

      case employeeDetailsScreen:
        final selectedEmployee = settings.arguments as Employee;
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create:(BuildContext context)=> EmployeesCubit(employeesRepository) ,
            child: EmployeeDetailsScreen(character : selectedEmployee)));
    }
  }
}
