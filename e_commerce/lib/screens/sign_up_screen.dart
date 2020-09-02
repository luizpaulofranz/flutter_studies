import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nome Completo"
              ),
              validator: (inputText) {
                if(inputText.isEmpty) return "E-mail inválido!";
              },
            ),
            SizedBox(height: 16),
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
            TextFormField(
              decoration: InputDecoration(
                hintText: "Endereço"
              ),
              validator: (inputText) {
                if(inputText.isEmpty) return "Endereço inválido!";
              },
            ),
            SizedBox(height: 16),
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
                },
                child: Text(
                  "Criar Conta",
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
      ),
    );
  }
}