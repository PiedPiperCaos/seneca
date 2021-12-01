import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seneca/models/usuarios_response.dart';
import 'package:seneca/providers/usuarios_provider.dart';
import 'package:seneca/services/firebase_service.dart';

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);
    final lista = usuariosProvider.usuarios;

    Size size = MediaQuery.of(context).size;

    return !isLoading
        ? Container(
            margin: EdgeInsets.only(top: 15),
            width: size.width * 0.85,
            height: 55,
            child: OutlinedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = new FirebaseService();
                try {
                  await service.signInwithGoogle();

                  User? user = FirebaseAuth.instance.currentUser;
                  String? usuarioGoogle = user!.email;
                  if (_comprobarCredenciales(lista, usuarioGoogle)) {
                    Navigator.pushNamed(context, "profile");
                  } else {
                    await service.signOutFromGoogle();
                    showDialog<String>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Usuario sin privilegios'),
                      ),
                    );
                  }
                } catch (e) {
                  if (e is FirebaseAuthException) {
                    print(e.message!);
                  }
                  if (e is PlatformException) {
                    print("No se ha seleccionado usuario");
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: Text(
                "Accede a tu cuenta de Google",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : Container(
            margin: EdgeInsets.all(15), child: CircularProgressIndicator());
  }
}

bool _comprobarCredenciales(List<Usuarios> listaUsuarios, String? usuario) {
  bool credencialesCorrectas = false;

  print(usuario);
  print(listaUsuarios);
  for (int i = 0; i < listaUsuarios.length; i++) {
    print(listaUsuarios[i]);
    if (listaUsuarios[i].usuario == usuario.toString()) {
      credencialesCorrectas = true;
    }
  }

  return credencialesCorrectas;
}
