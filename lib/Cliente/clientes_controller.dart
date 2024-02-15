import 'package:get/get.dart';

import '../infrastructure/models/business_model.dart';
import '../infrastructure/repositorys/business_repository.dart';

class ClientesController extends GetxController {
  BusinessRepository businessRepository = BusinessRepository();
  Future<List<BusinessModel>> getBusiness() async {
    return await businessRepository.getBusinessANDBicys();
  }
}
