class Employees {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Employees({this.id, this.email, this.firstName, this.avatar, this.lastName});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    text = json["text"];
  }
}

class ApiResponse {
  Employees? data;
  Support? support;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = Employees.fromJson(json['data']);
    support = Support.fromJson(json['support']);
  }
}

class Profile {
  String? name;
  String? job;

  Profile({this.name, this.job});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['name'] = name;
    data['job'] = job;

    return data;
  }
}
