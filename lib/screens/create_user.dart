import 'package:crud_flutter_app/models/employees.dart';
import 'package:crud_flutter_app/services/employee_service.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobCOntroller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create profile"),
      ),
      body: Form(
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
                controller: _jobCOntroller,
                decoration: const InputDecoration(
                    icon: Icon(Icons.home_repair_service),
                    hintText: 'What do you do?',
                    labelText: 'Job *',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  Profile newProfile = Profile(
                      name: _nameController.text, job: _jobCOntroller.text);
                  EmployeeService().createEmployee(newProfile);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Saved!")));
                  // Navigator.pop(context);
                }
              },
              child: const Text("Create profile"),
            )
          ],
        ),
      ),
    );
  }
}
