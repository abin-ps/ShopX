import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "ShopX",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          )
        ],
      ),
    );
  }
}
