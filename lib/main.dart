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
      home: HomeScreen(),
      // initialRoute: 'home_screen',
      // routes: {
      //   'home_screen': (_) => HomeScreen(),
      //   'profile': (_) => ProfileScreen(),
      // },
    );
  }
}
