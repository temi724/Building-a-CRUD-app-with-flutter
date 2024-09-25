import 'package:crud_flutter_app/models/employees.dart';
import 'package:crud_flutter_app/services/employee_service.dart';
import 'package:crud_flutter_app/utils/routes.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  // final Profile? profile;
  const CreateUser({
    super.key,
  });

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  late String name = "";
  late int id = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;

      id = int.parse(args["id"]);
      _nameController.text = args["name"];
    }
    // v;

    super.didChangeDependencies();
  }

  // @override
  // void initState() {
  //   if (id != 0) {
  //     _nameController.text ;
  //     // _jobController.text = ;
  //   }

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create profile"),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a value";
                    }
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'your first and last name?',
                      labelText: 'Name *',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a value";
                    }
                  },
                  controller: _jobController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.home_repair_service),
                      hintText: 'What do you do?',
                      labelText: 'Job *',
                      border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    Profile newProfile = Profile(
                        name: _nameController.text, job: _jobController.text);
                    if (id != 0) {
                      EmployeeService().updateEmployee(newProfile, id);
                    } else {
                      await EmployeeService().createEmployee(newProfile);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Saved!")));
                      Navigator.pushNamed(context, AppRouter.homeView);
                    }
                  }
                },
                child: Text(id == 0 ? "Create profile" : "update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
