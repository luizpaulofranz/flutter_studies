import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController _pageController;

  CustomDrawer(this._pageController);

  Widget _buildDrawerBackgroud() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBackgroud(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                // Stack and Positioned are a good option to distribute our components
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Text("Flutter's\nClothing", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: ScopedModelDescendant<User>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Olá, ${model.isLoggedIn() ? model.userData["name"] : ""}", 
                                style: TextStyle(
                                  fontSize: 18, 
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  model.isLoggedIn() ?
                                  "Sair" :
                                  "Entre ou cadastre-se",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor, 
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onTap: () {
                                  if(!model.isLoggedIn())
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => LoginScreen())
                                    );
                                  else
                                    model.signOut();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(icon: Icons.home, text: "Início", pageController: _pageController, page: 0),
              DrawerTile(icon: Icons.list, text: "Produtos", pageController: _pageController, page: 1),
              DrawerTile(icon: Icons.location_on, text: "Lojas", pageController: _pageController, page: 2),
              DrawerTile(icon: Icons.playlist_add_check, text: "Meus Pedidos", pageController: _pageController, page: 3),
            ],
          ),
        ],
      ),
    );
  }
}