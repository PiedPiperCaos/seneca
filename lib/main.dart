import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca/providers/usuarios_provider.dart';
import 'package:seneca/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seneca/services/firebase_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseService service = new FirebaseService();
  try {
    await service.signOutFromGoogle();
  } catch (e) {
    if (e is FirebaseAuthException) {
      print(e.message!);
    }
  }

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuariosProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
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
