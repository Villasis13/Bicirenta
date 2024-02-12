
class LoginModel {
  int? code;
  String? message;
  dynamic data;

  LoginModel({this.code, this.message,this.data});

  static List<LoginModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => LoginModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["result"]["code"],
        message: json["result"]["message"],
        data: json['data'],
      );
}