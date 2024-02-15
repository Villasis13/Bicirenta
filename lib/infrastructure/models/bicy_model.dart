class BicyModel {
  String? idBicy;
  String? typeBicy;
  String? infoBicy;
  String? priceBicy;
  String? statusBicy;

  BicyModel({
    this.idBicy,
    this.typeBicy,
    this.infoBicy,
    this.priceBicy,
    this.statusBicy,
  });

  static List<BicyModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BicyModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_bicicleta": idBicy,
        "tipo_bicicleta": typeBicy,
        "descripcion_bicicleta": infoBicy,
        "precio_x_hora": priceBicy,
        "estado": statusBicy,
      };

  factory BicyModel.fromJson(Map<String, dynamic> json) => BicyModel(
        idBicy: json["id_bicicleta"],
        typeBicy: json["tipo_bicicleta"],
        infoBicy: json["descripcion_bicicleta"],
        priceBicy: json["precio_x_hora"],
        statusBicy: json["estado"],

        // selectedAddsItem: json["selectedAddsItem"] != null
        //     ? List<AdditionalItem>.from(json["selectedAddsItem"].map((model) =>
        //         model is AdditionalItem
        //             ? model
        //             : AdditionalItem.fromJson(model)))
        //     : [],
      );
}
