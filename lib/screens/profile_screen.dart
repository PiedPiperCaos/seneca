import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seneca/services/firebase_service.dart';

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
                      Container(
                        child: Table(
                          border: TableBorder(
                              verticalInside:
                                  BorderSide(color: Colors.grey, width: 0.5),
                              horizontalInside:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          children: [
                            TableRow(children: [
                              GestureDetector(
                                  child: SingleCard(
                                      image: AssetImage("assets/sombrero.png"),
                                      text: "Alumnado del centro")),
                              GestureDetector(
                                child: SingleCard(
                                    image: AssetImage("assets/profesor.png"),
                                    text: "Personal del centro"),
                              ),
                              SingleCard(
                                  image: AssetImage("assets/covid.png"),
                                  text: "Información Covid"),
                            ]),
                            TableRow(children: [
                              SingleCard(
                                  image: AssetImage("assets/campana.png"),
                                  text: "Tablón de anuncios"),
                              SingleCard(
                                  image: AssetImage("assets/calendario.png"),
                                  text: 'Calendario escolar'),
                              Container()
                            ])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: Color(0xFF02569d),
            unselectedItemColor: Colors.grey,
            backgroundColor: Color.fromRGBO(55, 57, 84, 1),
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.timelapse), label: "Agenda"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: "Comunicaciones"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert_sharp), label: "Menú"),
            ]));
  }
}

class TarjetaFlotante extends StatelessWidget {
  const TarjetaFlotante({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 0.7,
              color: Colors.grey,
              offset: Offset(0, 1))
        ],
      ),
      width: 400,
      height: 200,
      child: Column(
        children: [
          _UsuarioOpciones(),
          _LineaBotones(),
        ],
      ),
    );
  }
}

class _UsuarioOpciones extends StatelessWidget {
  const _UsuarioOpciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "Martinez Megias, Carlos",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Icon(Icons.people)
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 15),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, "home_screen");
                              FirebaseService service = new FirebaseService();
                              try {
                                await service.signOutFromGoogle();
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  print(e.message!);
                                }
                              }
                            },
                            icon: Icon(
                              Icons.people,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 7),
                  child: Column(children: [
                    Text("I.E.S. Jándula",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text("Perfil alumno",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}

class _LineaBotones extends StatelessWidget {
  const _LineaBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 65,
        width: double.infinity,
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                    Text("Avisos", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(child: Container()),
              VerticalDivider(
                color: Colors.white,
              ),
              Expanded(child: Container()),
              GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.book, color: Colors.white),
                    Text("Bandeja de firmas",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
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

class SingleCard extends StatelessWidget {
  final AssetImage image;
  final String text;

  const SingleCard({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        height: size.height * 0.27,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10, top: 30),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image(
                  image: this.image,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                this.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            )
          ],
        ));
  }
}
