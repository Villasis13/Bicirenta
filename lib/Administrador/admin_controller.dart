import 'package:app_bicirrenta/infrastructure/models/inicio_admin_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/admin_repository.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  Future<InicioAdminModel> getDataInicio() async {
    return await AdminRepository().getDataInicio();
  }
}
