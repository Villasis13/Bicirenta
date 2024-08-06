// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:app_bicirrenta/Administrador/Bicicletas/list_bicy_controller.dart';
import 'package:app_bicirrenta/infrastructure/models/tipe_bicy_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/admin_repository.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../infrastructure/models/bicy_model.dart';
import '../../utils/enviroments.dart';
import 'Listado_Bicicletas.dart';

 enum SingingCharacter { Activo, Inactivo }

class AdminBicyController extends GetxController {
  var typeSelected = Rxn<TypeBicyModel>();
  RxString Ojo = "".obs;
  RxInt IdBicicletaselect = 0.obs;

  List<TypeBicyModel> datas = [];

  final TextEditingController nameBicyController = TextEditingController();
  final TextEditingController infoBicyController = TextEditingController();
  final TextEditingController priceBicyController = TextEditingController();

  int init = 0;

  bool ModalEstado(BuildContext context, int IdBici) {
    SingingCharacter _character = SingingCharacter.Activo; 

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Row(
                children: [
                  Text("Estado Bicicleta"),
                  SizedBox(width: 12),
                  // IconButton(
                  //   color: Colors.red,
                  //   onPressed: () => Navigator.pop(context),
                  //   icon: Icon(Icons.close),
                  // ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<SingingCharacter>(
                    title: const Text('Activo'),
                    value: SingingCharacter.Activo,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                  RadioListTile<SingingCharacter>(
                    title: const Text('Inactivo'),
                    value: SingingCharacter.Inactivo,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false); // Cancelar
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context, true); // Aceptar

                    bool validar = false;
                    if (_character == SingingCharacter.Activo) {
                      validar = await activarBicy(IdBici);
                    } else if (_character == SingingCharacter.Inactivo) {
                      validar = await desactivarBicy(IdBici);
                    }

                    if (validar) {
                      Get.find<ListBicyController>().update();
                      Get.back();
                    }
                  },
                  child: Text("Aceptar"),
                ),
              ],
            );
          },
        );
      },
    );

    return false; 
  }

   

  Future<List<TypeBicyModel>> getTypes() async {
    if (init == 0) {
      var typeBicy = await AdminRepository().getTypeBicysAdmin();

      if (typeBicy.isNotEmpty) typeSelected.value = typeBicy[0];
      datas = typeBicy;
      init++;
    }

    return datas;
  }

  void selectBicycleForEdit(BicyModel bicy) {
    // Encuentra el tipo de bicicleta correspondiente
    TypeBicyModel? selectedType = datas.firstWhere(
      (type) => type.nameTypeBicy == bicy.typeBicy,
      orElse: () => TypeBicyModel()
    );

    // Actualiza el controlador con los datos de la bicicleta seleccionada
    typeSelected.value = selectedType;
    nameBicyController.text = bicy.typeBicy ?? '';
    infoBicyController.text = bicy.infoBicy ?? '';
    priceBicyController.text = bicy.priceBicy ?? '';
    IdBicicletaselect.value = int.parse(bicy.idBicy.toString());
  }

  saveBicy(BuildContext context) async {
    if (typeSelected.value?.idTypeBicy == null || typeSelected.value!.idTypeBicy!.isEmpty) {
      return Get.snackbar('Datos incompletos', 'Seleccione el tipo de bicicleta');
    }

    if (priceBicyController.text.trim().isEmpty) {
      return Get.snackbar('Datos incompletos', 'Ingrese el precio por hora de la bicicleta');
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
      typeSelected.value!.idTypeBicy!,
      priceBicyController.text.trim(),
      infoBicyController.text.trim(),
    );

    progressDialog.close();

    if (resultado == 1) {
      ListBicyController reload = Get.find();
      reload.update();
      Get.snackbar('Información', 'Se guardado correctamente la bicicleta');
      resetFields();
      Navigator.pop(context);
    } else {
      Get.snackbar('Ocurrió un error', 'Inténtelo nuevamente');
    }
  }

  void resetFields() {
    typeSelected.value = datas.isNotEmpty ? datas[0] : TypeBicyModel();
    priceBicyController.clear();
    infoBicyController.clear();
    IdBicicletaselect.value = 0;
  }

  Future<void> updateBicy(int IdBicleta, int IdType, String Descripcion, String Precio) async {
    try {
      var response = await http.post(
        Uri.parse("${Enviroment.apiUrl}/Radministrador/guardar_bicicleta"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "id": IdBicleta.toString(),
          "id_tipobicicleta": IdType.toString(),
          "descripcion_bicicleta": Descripcion,
          "preciohora_bicicleta": Precio
        },
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Información', 'Se actualizada correctamente la bicicleta');
         ListBicyController reload = Get.find();
        reload.update();
        Navigator.pop(Get.context!);
      }
      else{
        Get.snackbar('Error', 'No se pudo actualizar la bicicleta');
      }
    } on SocketException {
      Get.snackbar('Problemas de red', 'Verifique su conexion a internet');
    } on HttpException {
      Get.snackbar('Error HTTP', 'ERROR EN EL SERVIDOR');
    }
  }

 

 Future<bool> desactivarBicy(int IdBicleta) async {
    bool validar = false;
    try {
      var response = await http.post(
        Uri.parse("${Enviroment.apiUrl}/Radministrador/desactivar_bici"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "id": IdBicleta.toString(),
        },
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 200) {
        var j = jsonDecode(response.body);
        if (j == 1) {
          validar = true;
          ListBicyController reload = Get.find();
          reload.update(); 
        }
      } else {
        Get.snackbar('Error', 'No se pudo desactivar la bicicleta');
      }
    } on SocketException {
      Get.snackbar('Problemas de red', 'Verifique su conexión a internet');
    } finally {
      return validar;
    }
  }

  Future<bool> activarBicy(int IdBicleta) async {
    bool validar = false;
    try {
      var response = await http.post(
        Uri.parse("${Enviroment.apiUrl}/Radministrador/activar_bici"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "id": IdBicleta.toString(),
        },
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 200) {
        var j = jsonDecode(response.body);
        if (j == 1) {
          validar = true;
          ListBicyController reload = Get.find();
          reload.update(); 
        }
      } else {
        Get.snackbar('Error', 'No se pudo activar la bicicleta');
      }
    } on SocketException {
      Get.snackbar('Problemas de red', 'Verifique su conexión a internet');
    } finally {
      return validar;
    }
  }

 


}

