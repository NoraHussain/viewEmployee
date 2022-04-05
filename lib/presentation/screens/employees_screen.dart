import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/employees_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/employees.dart';
import 'package:flutter_offline/flutter_offline.dart';

class EmployeesScreen extends StatefulWidget {
  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late List<Employee> allEmployees;
  late List<Employee> searchedEmployee;

  bool isSearching = false;
  final _seachTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EmployeesCubit>(context).getAllEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
        elevation: 0,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BuildBlocWidget();
          } else {
            return Center(child: Image.asset('assets/images/offline.gif'));
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _seachTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
          hintText: 'Find an employee..',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: MyColors.myGrey,
            fontSize: 18,
          )),
      style: TextStyle(
        color: MyColors.myGrey,
      ),
      onChanged: (s) {
        addSearchedForItemsToSearchedList(s);
      },
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<EmployeesCubit, EmployeesState>(
        builder: (context, state) {
      if (state is EmployeesLoaded) {
        allEmployees = (state).employee;
        return buildLoadedListWidget();
      } else {
        return CircularProgressIndicator(
          color: MyColors.myYellow,
        );
      }
    });
  }

  Widget buildLoadedListWidget() {
    return buildCharactersList();
  }

  Widget buildCharactersList() {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: _seachTextController.text.isEmpty
              ? allEmployees.length
              : searchedEmployee.length,
          itemBuilder: (_, index) {

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Image.asset("assets/images/employee.png", width: 30,) ,
                  title:Text(
                    _seachTextController.text.isEmpty
                        ? allEmployees[index].name
                        : searchedEmployee[index].name,
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                )

              ),
            );

          }),
    );

  }

  void addSearchedForItemsToSearchedList(s) {
    searchedEmployee = allEmployees
        .where((employee) => employee.name.toLowerCase().contains(s))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearching();
            },
            icon: Icon(
              Icons.search,
              color: MyColors.myGrey,
            ))
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _seachTextController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Employees',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

}
