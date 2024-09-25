import 'package:crud_flutter_app/models/employees.dart';
import 'package:crud_flutter_app/services/employee_service.dart';
import 'package:crud_flutter_app/utils/routes.dart';

import 'package:flutter/material.dart';

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
    // print("my id $id");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.abc_outlined,
      //     color: Colors.red,
      //   ),
      // ),
      backgroundColor: Colors.white,
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
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage("${user!.avatar}"),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                          Positioned(
                              left: 240,
                              bottom: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
                  Container(
                    // margin:
                    //     const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 10),
                            Text("${user.email}"),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRouter.createProfile, arguments: {
                              "id": "${user.id}",
                              "name": "${user.firstName}"
                            });
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 1,
                  // ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    // margin:
                    //     const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
                        // const Icon(
                        //   Icons.edit_outlined,
                        //   color: Colors.purple,
                        // )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
                        // const Icon(
                        //   Icons.edit_outlined,
                        //   color: Colors.purple,
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.description),
                            const SizedBox(width: 10),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              width: 300,
                              child: Text("${suport!.text}"),
                            )
                          ],
                        ),
                        // const Icon(
                        //   Icons.edit_outlined,
                        //   color: Colors.purple,
                        // )
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Delete user?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        EmployeeService().deleteEmploye(id);

                                        Navigator.pushNamed(
                                            context, AppRouter.homeView);
                                      },
                                      child: const Text("yes")),
                                  ElevatedButton(
                                      onPressed: () {}, child: const Text("No"))
                                ]);
                          });
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [
                            Icon(Icons.delete),
                            Text("Delete profile")
                          ],
                        ),
                      ),
                    ),
                  )
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
