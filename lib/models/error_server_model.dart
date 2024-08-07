class ErrorServerModel {
  final String errorMessage;

  ErrorServerModel({required this.errorMessage});

  factory ErrorServerModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorServerModel(errorMessage: jsonData['error']['message']);
  }
}
