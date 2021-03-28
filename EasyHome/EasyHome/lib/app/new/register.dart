import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/sing_in/composant/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  AuthServices auth = AuthServices();
  String email, passWord, userName, phone;
  final keys = GlobalKey<FormState>();

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
                      keyboardType: TextInputType.text,
                      onChanged: (e) => userName = e,
                      validator: (e) => e.isEmpty ? "champ vide" : null,
                      decoration: InputDecoration(labelText: "UserName")),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (e) => email = e,
                      validator: (e) => e.isEmpty ? "champ vide" : null,
                      decoration: InputDecoration(labelText: "Email")),
                  TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (e) => phone = e,
                      validator: (e) => e.isEmpty ? "champ vide" : null,
                      decoration: InputDecoration(labelText: "Phone")),
                  TextFormField(
                    obscureText: true,
                    onChanged: (e) => passWord = e,
                    validator: (e) => e.isEmpty
                        ? "cahmp vide"
                        : e.length < 6
                            ? "le password doit etre plus de 6"
                            : null,
                    decoration: InputDecoration(labelText: "PassWord"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (keys.currentState.validate()) {
                          loading(context);
                          bool register = await auth.signUp(
                              email, passWord, userName, phone);
                          if (register != null) {
                            Navigator.of(context).pop();
                          if (register) 
                          Navigator.of(context).pop();
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
