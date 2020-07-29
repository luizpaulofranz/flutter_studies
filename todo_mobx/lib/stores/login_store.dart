import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// here me mix-in our definition class with the generated one, and is that what we must use
class LoginStore = _LoginStore with _$LoginStore;

// must be abstract to avoid using this class, we must use the generated one, 
abstract class _LoginStore with Store {

  _LoginStore() {
    // autoRun is an action executed whenever any state has changed
    autorun((_){
      //print(email);
      //print(password);
      //print(isFormValid);
    });
  }

  // this indicates that this is a STATE, it is called core state
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  // this give us a way to change state
  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;
  }

  // are values that will be calculated from existing state, and whenever the state changes, it'll be re-runned
  // works in a similar way to observables, they are like "variables" but derived from states
  // it is called derived state
  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  // we can combine different computed values and return any type
  @computed
  Function get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login : null;

}