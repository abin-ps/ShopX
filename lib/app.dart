import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopX",
      home: HomePage(),
    );
  }
}
