import 'package:flutter/material.dart';

class Employee
{
  late var name;
  late var employee_name;
  late var  status;

  Employee.fromJson(Map<String , dynamic> json){
    name = json['name'];
    status = json['status'];
    employee_name = json['employee_name'];
  }
}