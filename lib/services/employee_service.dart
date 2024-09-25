import 'dart:convert';

import 'package:crud_flutter_app/models/employees.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  String baseUrl = "https://reqres.in/api/";

  Future getEmployee() async {
    List<Employees> allEmployees = [];
    try {
      var response = await http.get(Uri.parse("${baseUrl}users?per_page=12"));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        var employeeData = decodedData["data"];

        for (var employee in employeeData) {
          Employees newEmployee = Employees.fromJson(employee);
          allEmployees.add(newEmployee);
        }
        // print(allEmployees);
        return allEmployees;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ApiResponse> getEmployeeDetail(id) async {
    final response = await http.get(Uri.parse("${baseUrl}users/$id"));

    if (response.statusCode == 200) {
      // Parse the JSON response and map it to the ApiResponse model
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
  // getEmployeeDetails(int id) async {
  //   try {
  //     var response = await http.get(Uri.parse("${baseUrl}users/$id"));
  //     if (response.statusCode == 200) {
  //       var data = response.body;
  //       var decodeData = jsonDecode(data);
  //       return ApiResponse.fromJson(decodeData);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  createEmployee(Profile profile) async {
    try {
      var response =
          await http.post(Uri.parse('${baseUrl}users'), body: profile.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  editEmployee() async {
    try {} catch (e) {
      throw Exception(e.toString());
    }
  }

  deleteEmploye() async {
    try {} catch (e) {
      throw Exception(e.toString());
    }
  }
}

Future<dynamic> get(String api) async {}
