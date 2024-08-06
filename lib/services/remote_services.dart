import 'package:http/http.dart' as http;

import '../models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse("https://api.escuelajs.co/api/v1/products?limit=10&offset=0"));
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //todo show error here
      return null;
    }
  }
}
