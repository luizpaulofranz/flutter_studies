import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  final NotificationParams params;
  const NotificationsScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Notifications'),
          ),
          const SizedBox(height: 50),
          Center(
            child: Text('This is the text Param: ${params.text}'),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text('This is the number Param: ${params.number}'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: params.action,
            child: Text('This is the action param'),
          )
        ],
      ),
    );
  }
}

class NotificationParams {
  final String text;
  final int number;
  final VoidCallback action;

  NotificationParams({
    required this.text,
    required this.number,
    required this.action,
  });
}
