import 'package:flutter/material.dart';

import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/employees.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final Employee character;
  EmployeeDetailsScreen({required this.character});
  @override
  _EmployeeDetailsScreenState createState() =>
      _EmployeeDetailsScreenState(character: character);
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final Employee character;
  _EmployeeDetailsScreenState({required this.character});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Job : ', 'op'),
                  buildDivider(325),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 500,
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        // background: Hero(
        //   tag: character.employee_name,
        //   child: Image.network(
        //     character.image,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: value,
              style: TextStyle(color: MyColors.myWhite, fontSize: 16))
        ],
      ),
    );
  }

  buildDivider(double end) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: end,
      thickness: 2,
    );
  }
}
