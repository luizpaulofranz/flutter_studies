import 'package:auto_route/auto_route.dart';
import 'package:countries_app/modules/nested_routes/dashboard/notifications_screen.dart';
import 'package:countries_app/router/router.gr.dart';
import 'package:countries_app/router/routes.dart';
import 'package:flutter/material.dart';

// this is the first page of the nested routes
// the only thing it does is to serve as a face for the other nested routes
// this one and all the other nested routes here are rendered inside the dashboard nested wrapper screen one level above
// look the configuration on routes.dart
// and we need to handle the back button manuallyat the first screen of the nested routes
@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        // we have to manually handle the back button here because this is the first page of the nested routes
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Dashboard'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              context.router.push(
                NotificationsRoute(
                  params: NotificationParams(
                    text: 'Hello world',
                    number: 123,
                    action: () =>
                        print('A print passed as a callback function'),
                  ),
                ),
              );
            },
            child: Text('Notifications'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              context.router.pushPath(
                  '${Routes.dashboard.profile}/Param value - Profile');
            },
            child: Text('Profile'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              // this is how we pass path params
              context.router.pushPath(
                  '${Routes.dashboard.settings.root}/Param value - Settings');
            },
            child: Text('Settings - More nested'),
          ),
          // This is used to show the nested routes here inside the same screen
          // as here we adopt the strategy of rendering each nested route as an individual screen
          // everything is being rendered on dashboard nested wrapper screen one level above
          // Expanded(
          // child: AutoRouter(),
          // ),
        ],
      ),
    );
  }
}
