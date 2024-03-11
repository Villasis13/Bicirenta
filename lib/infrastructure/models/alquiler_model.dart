class AlquilerModel {
  String? idAlquiler;
  String? personName;
  String? devolucion;
  String? estado;

  AlquilerModel(
      {this.idAlquiler, this.personName, this.devolucion, this.estado});

  static List<AlquilerModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => AlquilerModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "id_alquiler": idAlquiler,
        "persona_nombre": personName,
        "devolucion": devolucion,
        "estado": estado,
      };

  factory AlquilerModel.fromJson(Map<String, dynamic> json) => AlquilerModel(
        idAlquiler: json["id_alquiler"],
        personName: json["persona_nombre"],
        devolucion: json["devolucion"],
        estado: json["estado"],
      );
}
