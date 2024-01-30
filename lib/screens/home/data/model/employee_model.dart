// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmployeeListResponseModel {
  String? status;
  List<EmployeeListInfoModel>? data;
  String? message;
  EmployeeListResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory EmployeeListResponseModel.fromJson(Map<String, dynamic> json) {
    var tempEmployeeInfo = json["data"] == null ? [] : json["data"] as List;
    List<EmployeeListInfoModel> employeeListInfoJsonToList =
        tempEmployeeInfo.map((e) => EmployeeListInfoModel.fromJson(e)).toList();
    return EmployeeListResponseModel(
      status: json["status"] ?? "",
      data: employeeListInfoJsonToList,
      message: json["message"] ?? "",
    );
  }
}

class EmployeeListInfoModel {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;
  EmployeeListInfoModel({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  factory EmployeeListInfoModel.fromJson(Map<String, dynamic> json) {
    return EmployeeListInfoModel(
      id: json["id"] ?? 0,
      employeeName: json["employee_name"] ?? "",
      employeeSalary: json["employee_salary"] ?? 0,
      employeeAge: json["employee_age"] ?? 0,
      profileImage: json["profile_image"] ?? "",
    );
  }
}
