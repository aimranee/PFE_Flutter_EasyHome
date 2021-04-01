import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/sign_in_page/composant/background.dart';
import 'package:easyhome/app/sign_in_page/composant/email_sign_up_form.dart';
import 'package:easyhome/app/sign_in_page/composant/loading.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthServices auth = AuthServices();
  String email, passWord;
  final keys = GlobalKey<FormState>();
  @override
  void _register(BuildContext context) {
    Navigator.of(context).push(
      // navigation in flutter
      MaterialPageRoute<void>(
        fullscreenDialog: true, // hiya li katle3 lpage bdiik tarii9a
        builder: (context) => EmailSignUpPage(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: RichText(
            text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: "Home", style: TextStyle(color: Colors.lightBlue)),
                ]),
          ),
          centerTitle: true,
        ),
        body: Background(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all((20)),
              child: Form(
                  key: keys,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          onChanged: (e) => email = e,
                          validator: (e) => e.isEmpty ? "champ vide" : null,
                          decoration: InputDecoration(
                              hintText: "Entrer votre email",
                              labelText: "Email")),
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
                              bool login = await auth.signIn(email, passWord);
                              if (login != null) {
                                Navigator.of(context).pop();
                                if (!login) print("incorrect");
                              }
                            }
                          },
                          child: Text("Sign In")),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Avez-vous un compte ?"),
                            TextButton(
                                onPressed: () => _register(context),
                                child: Text("Register"))
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
