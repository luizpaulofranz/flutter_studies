import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/*
 *  This class uses ScopedModel (extends Model part), is used to provide methods and data over the widget tree.
 */
class User extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  // this is a callback function, it will be called every time mode changes, this part needs to be revisited and improved
  // this was added to set user data on app opening
  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadUserData();
  }

  Future _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    // with this, we save data on firebase database, this is because FirebaseAuth only saves the user e-mail, and with this we sava aditional data.
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  Future _loadUserData() async {
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();

    if(firebaseUser != null) {
      DocumentSnapshot userSnapshot = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
      userData = userSnapshot.data;
    }
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

  void signIn({@required String email, @required String pass, VoidCallback onSucess, VoidCallback onFail}) async {
    isLoading = true;
    // this command forces reload on our ScopedModelDescendents Widgets
    notifyListeners();

    _auth.signInWithEmailAndPassword(
      email: email, 
      password: pass,
    ).then((user) async {
      firebaseUser = user.user;

      await _loadUserData();
      
      onSucess();

      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();

      isLoading = false;
      notifyListeners();
    });
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

}