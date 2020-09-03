import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();


  bool isLoading = false;

  Future _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    // with this, we save data on firebase database, this is because FirebaseAuth only saves the user e-mail, and with this we sava aditional data.
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFail}) {
    // to get loading state there on pageð
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData["email"], 
      password: pass
    ).then((user) async {
      firebaseUser = user.user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {

      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn() async {
    isLoading = true;
    // this command forces reload on our ScopedModelDescendents Widgets
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {

  }

  bool isLoggedIn() {
    return false;
  }

}