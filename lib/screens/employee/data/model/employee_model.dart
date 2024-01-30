class EmployeeResponseModel {
  String? status;
  String? message;
  EmployeeInfoModel? data;
  EmployeeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory EmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    return EmployeeResponseModel(
      status: json["status"],
      message: json["message"],
      data: EmployeeInfoModel.fromJson(json["data"]),
    );
  }
}

class EmployeeInfoModel {
  String? name;
  String? salary;
  String? age;
  int? id;
  EmployeeInfoModel({
    this.name,
    this.salary,
    this.age,
    this.id,
  });

  factory EmployeeInfoModel.fromJson(Map<String, dynamic> json) {
    return EmployeeInfoModel(
      name: json["name"] ?? "",
      salary: json["salary"] ?? "",
      age: json["age"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "salary": salary,
      "age": age,
      "id": id,
    };
  }
}
