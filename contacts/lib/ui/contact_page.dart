import 'dart:io';

import 'package:contacts/model/contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  Contact _editedContact;
  bool _dirty = false;

  @override
  void initState() {
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      // to ensure that will be different objects, to clone them
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          // a really simple form validation, only name is required
          if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
            // we can pass data through pages
            Navigator.pop(context, _editedContact);
          } else {
            // to set focus on the name field
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        backgroundColor: Colors.red,
      ),
      // SingleChildScrollView to ensure that the page can be scrolled
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: _editedContact.imgPath != null
                      ? DecorationImage(
                          image: FileImage(File(_editedContact.imgPath)))
                      : DecorationImage(
                          image: AssetImage("assets/person.png"),
                        ),
                ),
              ),
            ),
            TextField(
              // to controll the field focus
              focusNode: _nameFocus,
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _dirty = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller: _emailController,
              // set keyboard as email
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text) {
                _dirty = true;
                _editedContact.email = text;
              },
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Phone"),
              onChanged: (text) {
                _dirty = true;
                _editedContact.phone = text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
