import 'package:app_bicirrenta/infrastructure/models/alquiler_model.dart';
import 'package:app_bicirrenta/infrastructure/models/solicitudes_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class SolicitudesController extends GetxController {
  final AdminRepository repository = AdminRepository();

  Future<List<SolicitudesModel>> getSolicitudes() async {
    return await repository.getSolicitudes();
  }

  Future<List<AlquilerModel>> getAlquileres() async {
    return await repository.getAlquileres();
  }

  changeStatusSoli(
      BuildContext context, String text, String idSoli, String value) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BICI RENTA'),
          content: Text('¿Estás seguro que deseas $text la solicitud?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor:
                    Color.fromRGBO(78, 193, 176, 1.0), // Color del texto
              ),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                _updateStatus(context, idSoli, value);
              },
              style: TextButton.styleFrom(
                foregroundColor:
                    Color.fromRGBO(78, 193, 176, 1.0), // Color del texto
              ),
              child: Text('Si'),
            ),
          ],
        );
      },
    );
  }

  void _updateStatus(BuildContext context, String idSolid, String value) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(
        max: 100,
        msg: 'Cargando...',
        progressValueColor: const Color(0xFF35AF86),
        progressBgColor: Colors.orangeAccent,
        valueFontSize: 5,
        msgFontSize: 19,
        barrierColor: Color.fromRGBO(124, 136, 207, 0.514));

    int resultado = await repository.chageStatusSolicitudes(idSolid, value);

    progressDialog.close();

    if (resultado == 1) {
      update();
      Get.snackbar('Acción realizada',
          'Se ${(value == '2') ? 'aceptó' : 'rechazó'} la solicitud');
      Navigator.pop(context);
    } else {
      Get.snackbar('Ocurrió un error', 'Inténtelo nuevamente');
    }
  }
}
