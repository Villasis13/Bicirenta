
class UserModel {
  String? idUsuario;
  String? idPersona;
  String? usuarioNickname;
  String? usuarioEmail;
  String? usuarioImagen;
  String? personaNombre;
  String? personaApellidoPaterno;
  String? personaApellidoMaterno;
  String? idRol;
  String? rolNombre;
  String? token;

  UserModel({
    this.idUsuario,
    this.idPersona,
    this.usuarioNickname,
    this.usuarioEmail,
    this.usuarioImagen,
    this.personaNombre,
    this.personaApellidoPaterno,
    this.personaApellidoMaterno,
    this.idRol,
    this.rolNombre,
    this.token,
  });

  static List<UserModel> fronjsonList(List<dynamic> json)=>json.map((i) => UserModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        "c_u": idUsuario,
        "c_p": idPersona,
        "_n": usuarioNickname,
        "u_e": usuarioEmail,
        "u_i": usuarioImagen,
        "p_n": personaNombre,
        "p_p": personaApellidoPaterno,
        "p_m": personaApellidoPaterno,
        "ru": idRol,
        "rn": rolNombre,
        "tn": token,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUsuario: json["c_u"],
        idPersona: json["c_p"],
        usuarioNickname: json["_n"],
        usuarioEmail: json["u_e"],
        usuarioImagen: json["u_i"],
        personaNombre: json["p_n"],
        personaApellidoPaterno: json["p_p"],
        personaApellidoMaterno: json["p_m"],
        idRol: json["ru"],
        rolNombre: json["rn"],
        token: json["tn"],
      );
}