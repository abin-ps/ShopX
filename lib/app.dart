import 'package:flutter/material.dart';

import 'views/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShopX",
      home: const HomePage(),
    );
  }
}
