import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  final String param;
  const ProfileScreen({super.key, @PathParam('pathParam') required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Profile'),
          ),
          const SizedBox(height: 50),
          Center(
            child: Text('This is the Path Param: $param'),
          ),
        ],
      ),
    );
  }
}
