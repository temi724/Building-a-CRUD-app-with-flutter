import 'package:crud_flutter_app/models/employees.dart';
import 'package:crud_flutter_app/services/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({super.key});

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  late Future<ApiResponse>? futureUserData;
  late int id = 0;

  @override
  void initState() {
    super.initState();
    // futureUserData = EmployeeService().getEmployeeDetail(id);
  }

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    id = args["id"];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: EmployeeService().getEmployeeDetail(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error  fetching data"),
              );
            }
            if (snapshot.hasData) {
              final suport = snapshot.data!.support;
              final user = snapshot.data!.data;
              return Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage("${user!.avatar}"),
                                fit: BoxFit.contain)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.email),
                            const SizedBox(width: 10),
                            Text("${user.email}"),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.language),
                            const SizedBox(width: 10),
                            Text("${suport!.url}"),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ],
              );

              // var data=snapshot.data as List<Employees>;
            } else {
              return const Center(
                child: Text("Loading..."),
              );
            }
          }),
    );
  }
}
