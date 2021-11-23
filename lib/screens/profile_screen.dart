import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Background(),
              ],
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'iSéneca',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('Martinez Megias, Carlos')),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.people)),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              children: [
                                Text('I.E.S. Jándula'),
                                Text('Perfil dirección')
                              ],
                            ),
                          ),
                          Row()
                        ],
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Color.fromARGB(255, 1, 84, 156),
                )),
            Expanded(
                flex: 8,
                child: Container(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
