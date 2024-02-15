import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../../utils/enviroments.dart';
import '../models/business_model.dart';
import 'package:http/http.dart' as http;

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
}
