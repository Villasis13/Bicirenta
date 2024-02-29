import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/enviroments.dart';
import '../models/business_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class BusinessRepository extends GetConnect {
  Future<List<BusinessModel>> getBusinessANDBicys() async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/datos_vista_cliente';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
        },
      );

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

      List<BusinessModel> bussiness =
          BusinessModel.fromJsonList(decodeData['result']['negocios']);
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

  Future<List<BusinessModel>> searchAll(String query) async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/buscador';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'palabra_escrita': query,
        },
      );

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

      List<BusinessModel> bussiness = BusinessModel.fromJsonList(decodeData);
      return bussiness;
    } catch (error) {
      print('Error back $error');
      if (error is SocketException) {
        Get.snackbar('Problemas de conexión',
            'Asegúrese que el dispositivo cuente con una conexión a Internet');
        return [];
      }
      Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
      return [];
    }
  }

  Future<int> solictarAlquiler(String idBicy, String time) async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/solicitud_alquiler';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});

      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_persona': userSession.idPersona,
          'id_bicicleta': idBicy,
          'tiempo_solicitud': time,
        },
      );

      print('respuesta api ${response.body}');
      if (response.statusCode != 200) {
        Get.snackbar('Problemas de conexión',
            'Revise su conexión a Internet, e inténtelo nuevamente');
        return 2;
      }

      if (response.body.isEmpty) {
        Get.snackbar('Ocurrió un error', 'No se pudo ejecutar la petición');
        return 2;
      }

      var resp = jsonDecode(response.body);
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
