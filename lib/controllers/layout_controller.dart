import 'package:get/state_manager.dart';

enum ProductScrreenLayouts { listview, gridview }

class ProductScreenLayoutController extends GetxController {
  var defaultLayout = ProductScrreenLayouts.gridview;

  switchLayout(ProductScrreenLayouts selectedLayout) {
    defaultLayout = selectedLayout;
  }
}
