import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx_app/controllers/layout_controller.dart';
import 'package:shopx_app/controllers/product_controller.dart';
import 'package:shopx_app/views/settings_page.dart';
import 'package:shopx_app/views/widgets/product_card.dart';

import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const SettingsPage());
              },
              icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
        backgroundColor: Colors.blueGrey.shade50,
        scrolledUnderElevation: 0.0, //appbar color changing while scroll the body fix
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GetBuilder<ProductScreenLayoutController>(builder: (layoutController) {
              return Row(
                children: [
                  const Expanded(
                      child: Text(
                    "ShopX",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  )),
                  IconButton(
                      onPressed: () {
                        layoutController.switchLayout(ProductScrreenLayouts.listview);
                      },
                      icon: layoutController.defaultLayout == ProductScrreenLayouts.listview
                          ? const Icon(Icons.view_list_rounded, color: Colors.blueGrey)
                          : const Icon(Icons.view_list_rounded)),
                  IconButton(
                      onPressed: () {
                        layoutController.switchLayout(ProductScrreenLayouts.gridview);
                      },
                      icon: layoutController.defaultLayout == ProductScrreenLayouts.gridview
                          ? const Icon(Icons.grid_view, color: Colors.blueGrey)
                          : const Icon(Icons.grid_view))
                ],
              );
            }),
            Expanded(
              child: Obx(() {
                return productController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.blueGrey),
                      )
                    : NotificationListener(
                        onNotification: (ScrollNotification scrollDetails) {
                          //todo update load more later
                          return true;
                        },
                        child: RefreshIndicator(
                          color: Colors.blueGrey,
                          onRefresh: () async {
                            productController.fetchProducts();
                          },
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: (9 / 18.45)),
                              itemCount: productController.productList.length,
                              itemBuilder: (context, index) {
                                Product p = productController.productList[index];
                                Uri? imageUrl = Uri.tryParse(p.images[0]);

                                print("Origin: ${imageUrl?.origin}");
                                print("Path: ${imageUrl?.path}");
                                return ProductCard(
                                  productName: p.title,
                                  imageUrl: imageUrl == null ? null : imageUrl.origin + imageUrl.path,
                                  averageRating: 4.5,
                                  price: p.price,
                                  isFavorite: p.isFavorite.value,
                                  onFavoriteButtonClicked: () {
                                    //todo update favorite toggle here
                                    p.isFavorite.toggle();
                                  },
                                );
                              }),
                        ),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
