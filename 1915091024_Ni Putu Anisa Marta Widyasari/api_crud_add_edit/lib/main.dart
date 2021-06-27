import 'package:tokoku/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKOKU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username = "anisa marta";
  String password = "171717";
  String alert = "Siap Login";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  void prosesLogin() {
    if (_formKey.currentState.validate()) {
      if (usernameInput.text == username && passwordInput.text == password) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        setState(() {
          alert = "Username atau Password Salah";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      color: Colors.purple[100],
      child: new ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black87, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(alert),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: usernameInput,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Isi Username Anda";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 40,
                            ),
                            hintText: "Masukan Username",
                            hintStyle: TextStyle(color: Colors.black87),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.black87))),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: passwordInput,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Isi Password Anda";
                          }

                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 40,
                            ),
                            hintText: "Masukan Password",
                            hintStyle: TextStyle(color: Colors.black87),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black87))),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                        color: Colors.black87,
                        elevation: 5,
                        child: Container(
                            height: 50,
                            child: InkWell(
                                splashColor: Colors.white,
                                onTap: () => prosesLogin(),
                                child: Center(
                                  child: Text(
                                    "Masuk",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ))))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
