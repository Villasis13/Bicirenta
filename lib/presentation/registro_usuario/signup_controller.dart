import 'package:app_bicirrenta/infrastructure/models/login_model.dart';
import 'package:app_bicirrenta/infrastructure/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../infrastructure/models/user_model.dart';
import '../../infrastructure/repositorys/login_repository.dart';

class SignUpController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  //Business
  TextEditingController nameBusinessController = TextEditingController();
  TextEditingController addressBusinessController = TextEditingController();
  TextEditingController descriptionBusinessController = TextEditingController();

  void goToInicioScreen() {
    Get.offNamedUntil('/menuAdmin', (route) => false);
  }

  void goToInicioCliente() {
    Get.offNamedUntil('/inicioCliente', (route) => false);
  }

  LoginRepository repository = LoginRepository();

  void signUp(BuildContext context) async {
    String firstname = firstnameController.text.trim();
    String surname = surnameController.text.trim();
    String password = passwordController.text.trim();
    String password2 = password2Controller.text.trim();
    String document = documentController.text.trim();

    if (isValidForm(firstname, surname, document, password) &&
        isValidPassword(password, password2)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);

      progressDialog.show(
          max: 100,
          msg: 'Cargando...',
          progressValueColor: const Color(0xFF35AF86),
          progressBgColor: Colors.orangeAccent,
          valueFontSize: 5,
          msgFontSize: 19,
          barrierColor: Color.fromRGBO(124, 136, 207, 0.514));

      final data = SignUpmodel();

      data.fisrtName = firstname;
      data.surnaName = surname;
      data.documentName = document;
      data.password = password;

      LoginModel loginmodel = await repository.signUp(data);
      progressDialog.close();

      if (loginmodel.code == 1) {
        //Saving user login session
        GetStorage().write('user', loginmodel.data);
        UserModel userSession =
            UserModel.fromJson(GetStorage().read("user") ?? {});

        if (userSession.idRol == '4') {
          goToInicioCliente();
        } else {
          goToInicioScreen();
        }
      } else {
        Get.snackbar('El usuario ya existe', loginmodel.message ?? '');
      }
    }
  }

  void signUpBusiness(BuildContext context) async {
    String firstname = firstnameController.text.trim();
    String surname = surnameController.text.trim();
    String password = passwordController.text.trim();
    String password2 = password2Controller.text.trim();
    String document = documentController.text.trim();
    String business = nameBusinessController.text.trim();
    String address = addressBusinessController.text.trim();
    String info = descriptionBusinessController.text.trim();

    if (isValidForm2(firstname, surname, document, password, business) &&
        isValidPassword(password, password2)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);

      progressDialog.show(
          max: 100,
          msg: 'Cargando...',
          progressValueColor: const Color(0xFF35AF86),
          progressBgColor: Colors.orangeAccent,
          valueFontSize: 5,
          msgFontSize: 19,
          barrierColor: Color.fromRGBO(124, 136, 207, 0.514));

      final data = SignUpmodel();

      data.fisrtName = firstname;
      data.surnaName = surname;
      data.documentName = document;
      data.password = password;
      data.businessName = business;
      data.businessAddress = address;
      data.businessInfo = info;

      LoginModel loginmodel = await repository.signUp(data);
      progressDialog.close();

      if (loginmodel.code == 1) {
        //Saving user login session
        GetStorage().write('user', loginmodel.data);
        UserModel userSession =
            UserModel.fromJson(GetStorage().read("user") ?? {});

        if (userSession.idRol == '4') {
          goToInicioCliente();
        } else {
          goToInicioScreen();
        }
      } else {
        Get.snackbar('El usuario ya existe ', loginmodel.message ?? '');
      }
    }
  }

  bool isValidForm(
      String firstname, String surname, String document, String password) {
    if (firstname.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Nombre');
      return false;
    }
    if (surname.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Apellido');
      return false;
    }
    if (document.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Numero de DNI');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Contraseña vacío', 'Debes ingresar una Contraseña');
      return false;
    }

    return true;
  }

  bool isValidForm2(String firstname, String surname, String document,
      String password, String business) {
    if (business.isEmpty) {
      Get.snackbar('Negocio vacío', 'Debes ingresar el nombre del Negocio');
      return false;
    }
    if (firstname.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Nombre');
      return false;
    }
    if (surname.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Apellido');
      return false;
    }
    if (document.isEmpty) {
      Get.snackbar('Nombres vacío', 'Debes ingresar su Numero de DNI');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Contraseña vacío', 'Debes ingresar una Contraseña');
      return false;
    }

    return true;
  }

  bool isValidPassword(String pwd1, String pwd2) {
    if (pwd2 != pwd1) {
      Get.snackbar(
          'Contraseña no coincide', 'Debes ingresar la contraseña correcta');
      return false;
    }

    return true;
  }
}
