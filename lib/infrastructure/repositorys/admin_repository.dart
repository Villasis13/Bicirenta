import 'dart:convert';
import 'dart:io';

import 'package:app_bicirrenta/infrastructure/models/alquiler_model.dart';
import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:app_bicirrenta/infrastructure/models/solicitudes_model.dart';
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

  Future<List<BicyModel>> getMyBicys() async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/listado_bicicletas';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_negocio': userSession.idBusiness,
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

      List<BicyModel> bicy = BicyModel.fromJsonList(decodeData);
      return bicy;
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

      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_negocio': userSession.idBusiness,
          'id_tipobicicleta': idtype,
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

  Future<List<SolicitudesModel>> getSolicitudes() async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/vista_solicitudes';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});
      print(userSession.idPersona);
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_negocio': userSession.idBusiness,
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

      List<SolicitudesModel> bicy = SolicitudesModel.fromJsonList(decodeData);
      return bicy;
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

  Future<int> chageStatusSolicitudes(String idSoli, String value) async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/confirmar_alquiler';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});
      print(userSession.idPersona);
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_negocio': userSession.idBusiness,
          'id_solicitud': idSoli,
          'estado_confirmacion': value,
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

      var decodeData = jsonDecode(response.body);

      return decodeData;
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

  Future<List<AlquilerModel>> getAlquileres() async {
    try {
      String url = '${Enviroment.apiUrl}/Radministrador/vista_alquileres';
      UserModel userSession =
          UserModel.fromJson(GetStorage().read('user') ?? {});
      print(userSession.idPersona);
      final response = await http.post(
        Uri.parse(url),
        body: {
          'app': 'true',
          'id_negocio': userSession.idBusiness,
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

      List<AlquilerModel> bicy = AlquilerModel.fromJsonList(decodeData);
      return bicy;
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
