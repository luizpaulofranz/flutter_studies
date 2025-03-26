import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationSettingsScreen extends StatelessWidget {
  final String paramFromParentRoute;
  const NotificationSettingsScreen({
    super.key,
    @PathParam.inherit('pathParam') required this.paramFromParentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Notification Settings'),
          ),
          const SizedBox(height: 50),
          Center(
            child: Text(
                'This is the Path Param from parent route: $paramFromParentRoute'),
          ),
        ],
      ),
    );
  }
}
