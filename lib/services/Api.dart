import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxemall/models/product.dart';

class API {}

Future<Product> fetchProduct() async {
  final response = await http.get(Uri.https('fakestoreapi.com', 'products/2'));
  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Product');
  }
}
