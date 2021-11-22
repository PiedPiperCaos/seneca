import 'package:flutter/material.dart';

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
              Divider(
                height: 150,
              ),
              Container(
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
                        Divider(),
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
                        Divider(),
                        Container(
                            color: Colors.white,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'profile');
                                },
                                child: Text('Entrar'))),
                        Divider(
                          height: 70,
                        ),
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
                        Divider(
                          height: 120,
                        ),
                        Container(
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
                        Divider(
                          height: 10,
                        ),
                        Container(
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
