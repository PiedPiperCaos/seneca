import 'package:flutter/material.dart';
import 'package:seneca/models/usuarios_response.dart';
import 'package:http/http.dart' as http;

class UsuariosProvider extends ChangeNotifier {
  String idSheet = '1uw_yBPD6yQ9pZl7DWdhnBO-lFJIYwpO_7uUXW_eh8jA/';
  String baseURL = 'opensheet.vercel.app';
  String hojaSheet = 'hoja1';

  List<Usuarios> usuarios = [];

  UsuariosProvider() {
    print('Se ha inizializado el provider');
    this.getUsuarios();
  }

  getUsuarios() async {
    String respuesta = await _getJsonData();
    respuesta = '{"results":' + respuesta + "}";
    final credencialesResponse = UsuarioResponse.fromJson(respuesta);
    usuarios = [...credencialesResponse.results];

    notifyListeners();
  }

  Future<String> _getJsonData() async {
    final url = Uri.https(baseURL, idSheet + hojaSheet, {});
    final response = await http.get(url);
    return response.body;
  }
}
