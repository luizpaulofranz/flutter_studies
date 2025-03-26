import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacySettingsScreen extends StatelessWidget {
  final VoidCallback action;
  const PrivacySettingsScreen({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Privacy Settings'),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: action,
              child: Text('Tap to run callback action passed by param'))
        ],
      ),
    );
  }
}
