import 'package:get/state_manager.dart';

enum Layouts { listview, gridview }

class LayoutController extends GetxController {
  var defaultLayout = Layouts.gridview;

  switchLayout(Layouts selectedLayout) {
    defaultLayout = selectedLayout;
  }
}
