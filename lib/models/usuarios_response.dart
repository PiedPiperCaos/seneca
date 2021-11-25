// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromMap(jsonString);

import 'dart:convert';

class UsuarioResponse {
  UsuarioResponse({
    required this.results,
  });

  List<Usuarios> results;

  factory UsuarioResponse.fromJson(String str) =>
      UsuarioResponse.fromMap(json.decode(str));

  factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        results: List<Usuarios>.from(
            json["results"].map((x) => Usuarios.fromMap(x))),
      );
}

class Usuarios {
  Usuarios({
    required this.usuario,
    required this.pass,
  });

  String usuario;
  String pass;

  factory Usuarios.fromJson(String str) => Usuarios.fromMap(json.decode(str));

  factory Usuarios.fromMap(Map<String, dynamic> json) => Usuarios(
        usuario: json["usuario"],
        pass: json["pass"],
      );
}
