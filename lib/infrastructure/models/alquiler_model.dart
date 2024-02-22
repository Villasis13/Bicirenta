class AlquilerModel {
  String? idAlquiler;
  String? personName;
  String? devolucion;

  AlquilerModel({this.idAlquiler, this.personName, this.devolucion});

  static List<AlquilerModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => AlquilerModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_alquiler": idAlquiler,
        "persona_nombre": personName,
        "devolucion": devolucion,
      };

  factory AlquilerModel.fromJson(Map<String, dynamic> json) => AlquilerModel(
        idAlquiler: json["id_alquiler"],
        personName: json["persona_nombre"],
        devolucion: json["devolucion"],
      );
}
