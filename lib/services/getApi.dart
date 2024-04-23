import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_call_api/models/productModel.dart';

class GetApiCall {
  Future<List<ProductModel>> getAll() async {
    List<ProductModel> products = [];
    const String url = "http://192.168.1.15:5000/products/getAllProducts";
    final http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      // Decode the JSON response
      List<dynamic> jsonResponse = json.decode(resp.body);
      // Iterate over the list and create ProductModel objects
      products = jsonResponse.map((item) => ProductModel.fromJson(item)).toList();
      print("success");
    } else {
      print("failed: ${resp.statusCode}");
    }
    return products;
  }
}
