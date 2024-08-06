import 'package:get/state_manager.dart';
import 'package:shopx_app/services/remote_services.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var isMoreLoading = true.obs;
  int fetchMoreDataAPICallCount = 0;
  final productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true); //we also can isLoading like a function call and give the new value to it in getx instead of assigning like isLoading = true
      productList.value = await RemoteServices.fetchProducts() ?? [];
    } catch (e) {
      //todo show error loading products list error message
    } finally {
      isLoading(false);
    }
  }

  void fetchMoerProducts() async {
    try {
      isMoreLoading(true);
      productList.value += await RemoteServices.fetchProducts() ?? [];
    } catch (e) {
      //todo show error loading products list error message
    } finally {
      isMoreLoading(false);
    }
  }
}
