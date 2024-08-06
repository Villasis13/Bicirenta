import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:app_bicirrenta/infrastructure/repositorys/admin_repository.dart';
import 'package:get/get.dart';

class ListBicyController extends GetxController {
  
  Future<List<BicyModel>> getMyBicys() async {
    return await AdminRepository().getMyBicys();
  }
}
 




