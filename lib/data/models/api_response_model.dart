class ApiResponseModel {
  final dynamic ok;
  final String message;

  ApiResponseModel({required this.ok, required this.message});

  factory ApiResponseModel.fromJson(Map<String, dynamic> data) =>
      ApiResponseModel(
        ok: data,
        message: data['message'] as String,
      );

  Map<String, dynamic> toJson() => {
        ok: ok,
        message: message,
      };
}
