import 'package:contacts/model/contact.dart';
import 'package:contacts/repository/contact_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactRepository repository = ContactRepository();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
