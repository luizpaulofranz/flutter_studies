import 'package:auto_route/auto_route.dart';
import 'package:countries_app/router/router.gr.dart';
import 'package:countries_app/router/routes.dart';
import 'package:flutter/material.dart';

// this is the first page of the nested routes
// the only thing it does is to serve as a face for the other nested routes
// this one and all the other nested routes here are rendered inside the dashboard nested wrapper screen one level above
// look the configuration on routes.dart
// and we need to handle the back button manuallyat the first screen of the nested routes
@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        // we have to manually handle the back button here because this is the first page of the nested routes
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Settings with more nested links'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              context.router.push(
                PrivacySettingsRoute(
                  action: () => print('A print passed as a callback function'),
                ),
              );
            },
            child: Text('Privacy Settings'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              // context.router.push(NotificationSettingsRoute());
              context.router.pushPath(Routes.dashboard.settings.notifications);
            },
            child: Text('Notification Settings'),
          ),
        ],
      ),
    );
  }
}
