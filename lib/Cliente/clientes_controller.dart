import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../infrastructure/models/business_model.dart';
import '../infrastructure/repositorys/business_repository.dart';

class ClientesController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  List<BusinessModel> listSearch = [];
  List<BusinessModel> listBusiness = [];

  void goToDetailBicy(BicyModel bicy) {
    GetStorage().write('bicy_selected', bicy.toJson());
    Get.toNamed('/confirmAlquiler');
  }

  BusinessRepository businessRepository = BusinessRepository();

  Future<List<BusinessModel>> getBusiness() async {
    listBusiness = await businessRepository.getBusinessANDBicys();
    return listBusiness;
  }

  searchBuisiness() {
    final query = searchController.text.trim();
    if (query.isEmpty) {
      isSearch = false;
      update();
    } else if (query.length == 1) {
      isSearch = true;
      update();
    } else if (query.isNotEmpty) {
      final suggestion1 = listBusiness.where((business) {
        final businessName = business.nameBusiness?.toLowerCase();
        final input = query.toLowerCase();
        return businessName!.contains(input);
      }).toList();

      final suggestion2 = listBusiness.where((business) {
        final businessAddress = business.addressBusiness?.toLowerCase();
        final input = query.toLowerCase();
        return businessAddress!.contains(input);
      }).toList();

      listSearch.clear();

      listSearch.addAll(suggestion1);
      listSearch.addAll(suggestion2);

      listSearch = listSearch.toSet().toList();
      print(listSearch.length);
      // //listSearch = suggestion1;
      // listSearch = suggestion1;
      // print(suggestion1.length);

      getSearchBusiness();
      update();
    }
  }

  Future<List<BusinessModel>> getSearchBusiness() async {
    return await listSearch;
  }
}
