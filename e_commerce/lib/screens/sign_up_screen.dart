import 'package:e_commerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  void _onSignUpSuccess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 3),
      )
    );
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onSignUpFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário, tente novamente mais tarde!"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Nome Completo"
                  ),
                  validator: (inputText) {
                    if(inputText.isEmpty) return "E-mail inválido!";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
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
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: "Senha"
                  ),
                  obscureText: true,
                  validator: (inputText) {
                    if(inputText.isEmpty || inputText.length < 6) return "Senha inválida!";
                  },
                ),
                TextFormField(
                  controller: _addressController,
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
                    onPressed: model.isLoading ? null : () {
                      if(_formKey.currentState.validate()) {

                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text
                        };

                        model.signUp(
                          userData: userData, 
                          pass: _passController.text, 
                          onSuccess: _onSignUpSuccess, 
                          onFail: _onSignUpFail
                        );
                      }
                    },
                    child: model.isLoading ? Center(child: CircularProgressIndicator()) :
                     Text(
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
          );
        },
      )
    );
  }
}