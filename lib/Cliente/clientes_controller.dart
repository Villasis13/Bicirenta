import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../infrastructure/models/business_model.dart';
import '../infrastructure/repositorys/business_repository.dart';

class ClientesController extends GetxController {
  void goToDetailBicy(BicyModel bicy) {
    GetStorage().write('bicy_selected', bicy.toJson());
    Get.toNamed('/confirmAlquiler');
  }

  BusinessRepository businessRepository = BusinessRepository();
  Future<List<BusinessModel>> getBusiness() async {
    return await businessRepository.getBusinessANDBicys();
  }
}
