import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/sign_in_page/statutAuth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //bool darkThemeEnabled = false;
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
      //darkTheme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Statut(),
    );
  }
}
