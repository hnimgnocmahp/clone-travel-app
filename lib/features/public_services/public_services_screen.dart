import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicServicesScreen extends StatelessWidget{
  const PublicServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}