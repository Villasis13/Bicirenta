import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../infrastructure/repositorys/business_repository.dart';

class AlquilerController extends GetxController {
  var counter = 1.obs;
  var price = 0.0.obs;
  BicyModel bicy = BicyModel.fromJson(
    GetStorage().read('bicy_selected') ?? {},
  );

  AlquilerController() {
    price.value = double.parse(bicy.priceBicy ?? '0.0') * counter.value;
  }

  void addItem() {
    counter.value += 1;
    price.value = (double.parse(bicy.priceBicy ?? '0.0') * counter.value);
  }

  void removeItem() {
    if (counter.value > 1) {
      counter.value -= 1;

      price.value = (double.parse(bicy.priceBicy ?? '0.0') * counter.value);
    }
  }

  void solicitar(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(
        max: 100,
        msg: 'Cargando...',
        progressValueColor: const Color(0xFF35AF86),
        progressBgColor: Colors.orangeAccent,
        valueFontSize: 5,
        msgFontSize: 19,
        barrierColor: Color.fromRGBO(124, 136, 207, 0.514));

    int loginmodel = await BusinessRepository()
        .solictarAlquiler(bicy.idBicy!, counter.value.toString());
    progressDialog.close();

    if (loginmodel == 1) {
      Get.snackbar('Solicitud realizada', '');
      Navigator.pop(context);
    } else {
      Get.snackbar('Ocurrió un error', 'Inténtelo nuevamente');
    }
  }
}
