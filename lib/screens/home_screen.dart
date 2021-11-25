import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca/models/usuarios_response.dart';
import 'package:seneca/providers/usuarios_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _esconder = false;
  String _nombre = "";
  String _pass = "";

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);
    final listaUsuarios = usuariosProvider.usuarios;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.0, 1.0),
                colors: [
              Color.fromARGB(255, 1, 84, 156),
              Color.fromARGB(255, 0, 48, 89)
            ])),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  'iSéneca',
                  style: TextStyle(fontFamily: 'ErasDemi', fontSize: 75),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: 'Usuario',
                              //helperText: 'Solo es el nombre',
                            ),
                            onChanged: (valor) {
                              setState(() {
                                _nombre = valor;
                              });
                            },
                          ),
                        ),
                        TextField(
                          obscureText: _esconder,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Contraseña',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _esconder = !_esconder;
                                  });
                                },
                                child: Icon(Icons.remove_red_eye)),
                          ),
                          onChanged: (valor) {
                            setState(() {
                              _pass = valor;
                            });
                          },
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: 55,
                            margin: EdgeInsets.only(top: 20, bottom: 70),
                            child: TextButton(
                                onPressed: () {
                                  for (int i = 0;
                                      i < listaUsuarios.length;
                                      i++) {
                                    if (_nombre == listaUsuarios[i].usuario &&
                                        _pass == listaUsuarios[i].pass) {
                                      Navigator.pushNamed(context, 'profile');
                                    }
                                  }
                                },
                                child: Text('Entrar'))),
                        Container(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2, color: Colors.white))),
                              child: Column(
                                children: [
                                  Text(
                                    'No recuerdo mi contraseña',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 170),
                          child: Row(
                            children: [
                              Image(
                                height: 60,
                                width: 60,
                                color: Colors.white,
                                image: AssetImage('assets/andalucia.png'),
                              ),
                              Container(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Junta de Andalucia',
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Consejería de Educación y Deporte')
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'v11.3.0',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
