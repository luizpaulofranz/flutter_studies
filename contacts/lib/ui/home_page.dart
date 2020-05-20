import 'dart:io';

import 'package:contacts/model/contact.dart';
import 'package:contacts/repository/contact_repository.dart';
import 'package:contacts/ui/contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactRepository repository = ContactRepository();

  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
    this._loadAllContacts();
  }

  void _loadAllContacts() {
    repository.getAll().then((value) {
      setState(() {
        contacts = value;
      });
    });
  }

  void _showContactPage({Contact contact}) async {
    // we can receive the entitiy back when we call Navigator.pop, but when we tap back button, the return is null
    final contactToSave = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );

    if (contactToSave != null) {
      if (contact != null) {
        await repository.update(contactToSave);
      } else {
        await repository.save(contactToSave);
      }
      _loadAllContacts();
    }
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _showContactPage(contact: contacts[index]);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: contacts[index].imgPath != null
                        ? DecorationImage(
                            image: FileImage(File(contacts[index].imgPath)))
                        : DecorationImage(
                            image: AssetImage("assets/person.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // as we saw before, Scaffold is an Material implementation that allows us to usa other material resources, like a floating button
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
    );
  }
}
