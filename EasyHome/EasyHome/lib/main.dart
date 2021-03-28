import 'package:easyhome/app/new/loginPage.dart';
import 'package:easyhome/app/new/statutAuth.dart';
import 'package:easyhome/app/screen/home/Home_screen.dart';
import 'package:easyhome/app/sing_in/composant/login.dart';
import 'package:easyhome/app/sing_in/landing_page.dart';
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
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Statut(),
    );
  }
}
