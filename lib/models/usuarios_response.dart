// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromMap(jsonString);

import 'dart:convert';

class UsuarioResponse {
  UsuarioResponse({
    required this.results,
  });

  List<Result> results;

  factory UsuarioResponse.fromJson(String str) =>
      UsuarioResponse.fromMap(json.decode(str));

  factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    required this.usuario,
    required this.pass,
  });

  String usuario;
  String pass;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        usuario: json["usuario"],
        pass: json["pass"],
      );
}
