class ApiEndPoint {
  // Base URL
  static const String baseUrl = "https://dummy.restapiexample.com/api/v1/";
  static const String employees = "employees";
  static const String updateEmployees = "update";
  static const String createEmployees = "create";

  // Timeout values
  static const int receiveTimeout = Duration.microsecondsPerDay;
  static const int connectionTimeout = Duration.microsecondsPerMillisecond;
}
