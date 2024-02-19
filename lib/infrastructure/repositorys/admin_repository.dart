import 'dart:convert';
import 'dart:io';

import 'package:app_bicirrenta/infrastructure/models/tipe_bicy_model.dart';
import 'package:app_bicirrenta/infrastructure/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/enviroments.dart';
import 'package:http/http.dart' as http;

class AdminRepository extends GetConnect {
  Future<List<TypeBicyModel>> getTypeBicysAdmin() async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/tipo_bicicleta';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
        },
      );

      print('respuesta api ${response.body}');
      if (response.statusCode != 200) {
        Get.snackbar('Problemas de conexión',
            'Revise su conexión a Internet, e inténtelo nuevamente');
        return [];
      }

      if (response.body.isEmpty) {
        Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
        return [];
      }

      var decodeData = jsonDecode(response.body);

      List<TypeBicyModel> bussiness = TypeBicyModel.fromJsonList(decodeData);
      return bussiness;
    } catch (error) {
      print(error);
      if (error is SocketException) {
        Get.snackbar('Problemas de conexión',
            'Asegúrese que el dispositivo cuente con una conexión a Internet');
        return [];
      }
      Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
      return [];
    }
  }

  Future<int> saveNewBicy(String idtype, String price, String info) async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/guardar_bicicleta';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});

      print(userSession.idBusiness);

      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_persona': userSession.idBusiness,
          'id_tipo_bicicleta': idtype,
          'descripcion_bicicleta': info,
          'preciohora_bicicleta': price,
        },
      );
      if (response.statusCode != 200) {
        Get.snackbar('Problemas de conexión',
            'Revise su conexión a Internet, e inténtelo nuevamente');
        return 2;
      }

      if (response.body.isEmpty) {
        Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
        return 2;
      }

      int resp = jsonDecode(response.body);

      return resp;
    } catch (error) {
      print(error);
      if (error is SocketException) {
        Get.snackbar('Problemas de conexión',
            'Asegúrese que el dispositivo cuente con una conexión a Internet');
        return 2;
      }
      Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
      return 2;
    }
  }
}
