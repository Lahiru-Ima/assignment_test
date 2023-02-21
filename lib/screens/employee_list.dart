import 'package:assignment_mypos/data/employee.dart';
import 'package:assignment_mypos/services/employee_service.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: FutureBuilder<List<Employee>?>(
          future: EmployeeService.getEmployees(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error!'),
              );
            } else if (snapshot.hasData) {
              List<Employee>? employees = snapshot.data;
              return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var employee = snapshot.data?[index];
                  return Container(
                    height: 70.0,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text('${employee?.empNo}')),
                        Expanded(flex: 3, child: Text('${employee?.empName}')),
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(child: Text('Edit')),
                                )
                              ],
                            )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 0.5,
                    height: 0.5,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
