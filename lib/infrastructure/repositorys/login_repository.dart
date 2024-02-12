
import 'dart:convert';
import 'package:app_bicirrenta/infrastructure/models/login_model.dart';
import 'package:app_bicirrenta/utils/enviroments.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends GetConnect {
  Future<LoginModel> login(String user, String password) async {
    try {
      String url = '${Enviroment.apiUrl}/login/validar_sesion';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': "true",
          'usuario_nickname': user,
          'usuario_contrasenha': password,
        },
      );

      if (response.statusCode != 200) {
        Get.snackbar('Problemas de conexión',
            'Revise su conexión a Internet, e inténtelo nuevamente');
        return LoginModel();
      }

      if (response.body.isEmpty) {
        Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
        return LoginModel();
      }
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));

      return loginModel;
      
    } catch (error) {
      if (error is SocketException) {
        Get.snackbar('Problemas de conexión',
            'Asegúrese que el dispositivo cuente con una conexión a Internet');
        return LoginModel();
      }
      Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
      return LoginModel();
    }
  }
}

class SocketException {}
