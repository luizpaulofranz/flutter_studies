import 'package:scoped_model/scoped_model.dart';

class User extends Model {

  bool isLoading = false;

  void signUp() {

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