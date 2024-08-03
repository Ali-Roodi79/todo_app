import 'package:flutter/material.dart';
import 'package:db_project/CMS/Panel.dart';
import 'package:db_project/components/Form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/login": (context) => const Login(),
        "/": (context) => const Panel()
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreen();
}

class LoginScreen extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _emailValue;
  String? _passwordValue;

  emailOnSaved(dynamic value) {
    _emailValue = value;
  }

  passwordOnSaved(dynamic value) {
    _passwordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xff2c5364), Color(0xff0f2027)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Opacity(
              opacity: 0.25,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.repeat)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: (size.width > size.height)
                            ? 0
                            : size.height * 0.03)),
                const Text(
                  "Sign in to Rallex",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.1)),
                FormContainer(
                    formKey: _formKey,
                    emailOnSaved: emailOnSaved,
                    passwordOnSaved: passwordOnSaved),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "New to Rallex? ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),
                    FlatButton(
                        padding: EdgeInsets.only(),
                        onPressed: null,
                        child: Text(
                          "Create an account.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: Colors.blueAccent,
                              fontSize: 14
                          ),
                        )
                    )
                  ],
                ),*/
                Padding(padding: EdgeInsets.only(top: size.height * 0.25)),
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                }
                if (_emailValue == 'admin' && _passwordValue == 'admin') {
                  Navigator.pushNamed(context, "/");
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color(0xff234961),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      letterSpacing: .3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
