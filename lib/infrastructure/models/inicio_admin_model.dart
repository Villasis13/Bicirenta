class InicioAdminModel {
  String? gDiaria;
  String? gMensual;

  InicioAdminModel({this.gDiaria, this.gMensual});

  factory InicioAdminModel.fromJson(Map<String, dynamic> json) =>
      InicioAdminModel(
        gDiaria: json["ganancias"]['diaria'][0]['total_d'],
        gMensual: json["ganancias"]['mensual'][0]['total_m'],
      );
}
