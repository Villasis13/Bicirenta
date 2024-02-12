
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogOutController extends GetxController
{
    void logout() {
    GetStorage().remove('user');
    Get.offNamedUntil(
        '/login', (route) => false); //Eliminar el historial de pantallas
  }
}