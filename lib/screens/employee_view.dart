import 'package:crud_flutter_app/models/employees.dart';
import 'package:crud_flutter_app/services/employee_service.dart';
import 'package:crud_flutter_app/utils/routes.dart';
import 'package:flutter/material.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Profiles"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              EmployeeService().getEmployee();
            },
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: FutureBuilder(
        future: EmployeeService().getEmployee(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Fetching data"),
            );
          }
          if (snapshot.hasData) {
            var data = snapshot.data as List<Employees>;
            return ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                const SizedBox(
                  height: 20,
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.singleUser,
                        arguments: {"id": data[index].id});
                    // print("Hello ${data[index].id}");
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 8, left: 8, top: 3),
                      height: 90,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.purple[500],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              data[index].avatar!)))),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[index].firstName!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data[index].email!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[800],
                          )
                        ],
                      )),
                );
                //   return ListTile(
                //     leading: CircleAvatar(
                //       backgroundImage: ,
                //     ),
                //     title: Text(data[index].firstName!),
                //     subtitle: Text(data[index].email!),
                //   );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
