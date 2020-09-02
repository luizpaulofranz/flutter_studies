import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
          ),
        ],
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "E-mail"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (inputText) {
                    if(inputText.isEmpty || !inputText.contains("@")) return "E-mail inválido!";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Senha"
                  ),
                  obscureText: true,
                  validator: (inputText) {
                    if(inputText.isEmpty || inputText.length < 6) return "Senha inválida!";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {}, 
                    child: Text("Esqueci minha senha", textAlign: TextAlign.right),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        // do login
                      }
                      model.signIn();
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}