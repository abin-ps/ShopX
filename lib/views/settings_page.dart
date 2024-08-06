import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade50,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Settings"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(36),
            child: Icon(
              Icons.settings,
              size: 144,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Version 1.0.0"),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("About Us"),
          ),
        ],
      )),
    );
  }
}
