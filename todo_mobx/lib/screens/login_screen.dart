import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // here we can use our actions just calling them, as we do in onChange of CustomTextFields bellow
  LoginStore loginStore;

  ReactionDisposer reactionDisposer;

  // a good place to put auto-run codes. Like componentDidMount from react
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // that's how we get our instance from provider
    loginStore = Provider.of<LoginStore>(context);

    // we can use the autorun mobx function anywhere we have access to our store, like here!
    // it works the same way as on login_store, when any observable/state changes, it is executed
    /*autorun((_){
      if(loginStore.loggedIn)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ListScreen())
        );
    });*/

    // a mobx callback function for a specific observable/state change, the first param is the state watched, the second is the callback
    // it will be watching forever, so its important to do a dispose in reaction functions, see bellow the widget dispose method
    reactionDisposer = reaction(
      (_) => loginStore.loggedIn, 
      (loggedIn) {
        if(loginStore.loggedIn)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => ListScreen())
          );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (context) {
                        return CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                          enabled: !loginStore.loading,
                        );
                      },
                    ),
                    SizedBox(height: 16,),
                    Observer(
                      builder: (context) {
                        return CustomTextField(
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: !loginStore.passwordVisible,
                          onChanged: loginStore.setPassword,
                          enabled: !loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: !loginStore.passwordVisible ? Icons.visibility : Icons.visibility_off,
                            onTap: loginStore.togglePasswordVisibility,
                          ),
                        );
                      } 
                    ),
                    const SizedBox(height: 16,),
                    // this is a widget which reacts to changes in any @observable/@computed (state) and re-builds its content
                    Observer(
                      builder: (context) {
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: loginStore.loading
                            ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                            : Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            // if this param is null, the button becomes "disabled"
                            onPressed: loginStore.loginPressed,
                          ),
                        );
                      }
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // to unasign our reaction with the state
    reactionDisposer();
    super.dispose();
  }

}
