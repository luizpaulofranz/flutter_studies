import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // all the child nodes of this ScopedModel now can access the model User like a singleton, 
    // using the ScopedModelDescendant<User> Widget, and there we can manipulate our model (User)
    // look at User model de function notifyListeners().
    return ScopedModel<User>(
      model: User(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter\'s Clothing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        home: HomeScreen(),
      ),
    );
  }
}