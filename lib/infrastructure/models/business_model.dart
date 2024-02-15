import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';

class BusinessModel {
  String? idBusiness;
  String? addressBusiness;
  String? nameBusiness;

  List<BicyModel>? bicys;

  BusinessModel({
    this.idBusiness,
    this.addressBusiness,
    this.nameBusiness,
    this.bicys,
  });

  static List<BusinessModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BusinessModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_negocio": idBusiness,
        "nombre": nameBusiness,
        "ubicacion": addressBusiness,
        "bicicletas": bicys,
      };

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        idBusiness: json["id_negocio"],
        nameBusiness: json["nombre"],
        addressBusiness: json["ubicacion"],
        bicys: json["bicicletas"] != null
            ? List<BicyModel>.from(json["bicicletas"].map((model) =>
                model is BicyModel ? model : BicyModel.fromJson(model)))
            : [],
      );
}
