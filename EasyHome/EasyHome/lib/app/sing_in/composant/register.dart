import 'package:easyhome/app/sing_in/composant/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  String email, passWord;
  final keys = GlobalKey<FormState>();

  Future<bool> signup(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all((15)),
          child: Form(
              key: keys,
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      onChanged: (e) => email = e,
                      validator: (e) => e.isEmpty ? "champ vide" : null,
                      decoration: InputDecoration(
                          hintText: "Entrer votre email", labelText: "Email")),
                  TextFormField(
                    obscureText: true,
                    onChanged: (e) => passWord = e,
                    validator: (e) => e.isEmpty
                        ? "cahmp vide"
                        : e.length < 6
                            ? "le password doit etre plus de 6"
                            : null,
                    decoration: InputDecoration(
                        hintText: "Entrer votre PassWord",
                        labelText: "PassWord"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (keys.currentState.validate()) {
                          loading(context);
                          bool register = await signup(email, passWord);
                          if (register != null) {
                            Navigator.of(context).pop();
                            if (!register) Navigator.of(context).pop();
                          }
                        }
                      },
                      child: Text("Sign Up"))
                ],
              )),
        ),
      ),
    ));
  }
}
