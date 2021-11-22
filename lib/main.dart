import 'package:flutter/material.dart';
import 'package:seneca/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (BuildContext context) => HomeScreen(),
        'profile': (BuildContext context) => ProfileScreen(),
      },
    );
  }
}
