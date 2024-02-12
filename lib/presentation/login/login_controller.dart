
import 'package:app_bicirrenta/infrastructure/models/login_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegistrarCliente()
  {
    Get.toNamed('/registrarCliente');
  }

  void goToRegistrarNegocio()
  {
    Get.toNamed('/registrarNegocio');
  }

  void goToInicioScreen() {
    Get.offNamedUntil('/menuAdmin', (route) => false);
  }

  LoginRepository repository = LoginRepository();

  void login(BuildContext context) async {
    String user = userController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(user, password)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);

      progressDialog.show(
          max: 100,
          msg: 'Cargando...',
          progressValueColor: const Color(0xFF35AF86),
          progressBgColor: Colors.orangeAccent,
          valueFontSize: 5,
          msgFontSize: 19,
          barrierColor: Color.fromRGBO(124, 136, 207, 0.514));
          
      LoginModel loginmodel = await repository.login(user, password);
      progressDialog.close();

      if (loginmodel.code == 1) {        
        //Saving user login session
        GetStorage().write('user', loginmodel.data);
        goToInicioScreen();
      } else {
        Get.snackbar('Ocurrió un error', loginmodel.message ?? '');
      }
    }
  }

  bool isValidForm(String user, String password) {
    if (user.isEmpty) {
      Get.snackbar('Usuario vacío', 'Debes ingresar el Usuario');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Contraseña vacío', 'Debes ingresar una Contraseña');
      return false;
    }

    return true;
  }
}
