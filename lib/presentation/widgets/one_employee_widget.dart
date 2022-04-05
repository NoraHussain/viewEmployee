import 'package:flutter/material.dart';

import 'package:flutter_breaking/data/models/employees.dart';

class OneEmployeeWidget extends StatelessWidget {
  final Employee employee;
  OneEmployeeWidget({required this.employee});

  @override
  Widget build(BuildContext context) {
    //Navigator.pushNamed(context, employeeDetailsScreen,
    //  arguments: employee);
    return ListTile(
      title: Text(
        '${employee.employee_name}',
      ),
    );
  }
}


//   employee.image.isNotEmpty
//       ? FadeInImage.assetNetwork(
//           width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.cover,
//           placeholder: 'assets/images/loading.gif',
//           image: employee.image)
//       : Image.asset('assets/images/placeholder.png'),