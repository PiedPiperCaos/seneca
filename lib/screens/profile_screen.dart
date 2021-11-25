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
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      'iSéneca',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    TarjetaFlotante(),
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

class TarjetaFlotante extends StatelessWidget {
  const TarjetaFlotante({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'Martinez Megias, Carlos',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 110),
                  child: Icon(Icons.people, color: Colors.black))
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'I.E.S. Jándula',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Perfil dirección',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [Icon(Icons.alarm), Text('Avisos')],
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(
                    child: Row(children: [
                      Icon(Icons.book),
                      Text('Bandeja de firmas')
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
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
