import 'package:app_bicirrenta/Administrador/Bicicletas/list_bicy_controller.dart';
import 'package:app_bicirrenta/infrastructure/models/tipe_bicy_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AdminBicyController extends GetxController {
  var typeSelected = TypeBicyModel().obs;

  List<TypeBicyModel> datas = [];

  final TextEditingController nameBicyController = TextEditingController();
  final TextEditingController infoBicyController = TextEditingController();
  final TextEditingController priceBicyController = TextEditingController();

  int init = 0;

  Future<List<TypeBicyModel>> getTypes() async {
    if (init == 0) {
      var typeBicy = await AdminRepository().getTypeBicysAdmin();

      if (typeBicy.isNotEmpty) typeSelected.value = typeBicy[0];
      datas = typeBicy;
      init++;
    }

    return datas;
  }

  saveBicy(BuildContext context) async {
    if (typeSelected.value.idTypeBicy == '') {
      return Get.snackbar(
          'Datos incompletos', 'Selecione el tipo de bicicleta');
    }

    if (priceBicyController.text.trim().isEmpty) {
      return Get.snackbar(
          'Datos incompletos', 'Ingrese el precio por hora de la bicicleta');
    }

    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(
        max: 100,
        msg: 'Cargando...',
        progressValueColor: const Color(0xFF35AF86),
        progressBgColor: Colors.orangeAccent,
        valueFontSize: 5,
        msgFontSize: 19,
        barrierColor: Color.fromRGBO(124, 136, 207, 0.514));

    int resultado = await AdminRepository().saveNewBicy(
      typeSelected.value.idTypeBicy!,
      priceBicyController.text.trim(),
      infoBicyController.text.trim(),
    );

    progressDialog.close();

    if (resultado == 1) {
      ListBicyController reload = Get.find();
      reload.update();
      Get.snackbar('Acción realizada',
          'Información de la bicicleta fue guardado correctamente');
      Navigator.pop(context);
    } else {
      Get.snackbar('Ocurrió un error', 'Inténtelo nuevamente');
    }
  }
}
