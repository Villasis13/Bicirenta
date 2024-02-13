import 'package:app_bicirrenta/infrastructure/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  void goLogin() {
    Get.offNamedUntil('/login', (route) => false);
  }

  void goToInicio() {
    Get.offNamedUntil('/menuAdmin', (route) => false);
  }

  void goToInicioCliente() {
    Get.offNamedUntil('/inicioCliente', (route) => false);
  }

  void getInitialScreen() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      //goLogin();
      UserModel userSession =
          UserModel.fromJson(GetStorage().read("user") ?? {});

      if (userSession.idUsuario != null) {
        if (userSession.idRol == '4') {
          goToInicioCliente();
        } else {
          goToInicio();
        }
      } else {
        goLogin();
      }
    });
  }
}
