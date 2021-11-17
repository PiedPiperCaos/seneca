import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _esconder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          children: [
            Divider(
              height: 150,
            ),
            Container(
              child: Text(
                'iSéneca',
                style: TextStyle(fontSize: 60),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Usuario',
                          //helperText: 'Solo es el nombre',
                        ),
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
                        //helperText: 'Solo es el nombre',
                      ),
                    ),
                    Divider(),
                    Container(
                        color: Colors.white,
                        child:
                            TextButton(onPressed: () {}, child: Text('Entrar')))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
