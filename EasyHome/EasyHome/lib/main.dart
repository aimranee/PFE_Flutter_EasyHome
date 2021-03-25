import 'package:easyhome/app/screen/home/Home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyHome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFFC61F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFFB5BFD0)),
          body2: TextStyle(color: Color(0xFFB5BFD0)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
