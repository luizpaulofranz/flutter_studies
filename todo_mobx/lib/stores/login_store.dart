import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// here me mix-in our definition class with the generated one, and is that what we must use
class LoginStore = _LoginStore with _$LoginStore;

// must be abstract to avoid using this class, we must use the generated one, 
abstract class _LoginStore with Store {

  _LoginStore() {
    // autoRun is an action executed whenever any state has changed
    autorun((_){
      print(email);
      print(password);
    });
  }

  // this indicates that this is a STATE
  @observable
  String email = "";

  @observable
  String password = "";

  // this give us a way to change state
  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

}