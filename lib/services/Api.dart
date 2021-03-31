import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxemall/models/product.dart';
import 'package:luxemall/services/network.dart';

const String baseUrl = "fakestoreapi.com";
const String singleProduct = 'https://fakestoreapi.com/products/1';
const String allProduct = 'https://fakestoreapi.com/products';
const String cartApi = 'https://fakestoreapi.com/carts';
const String category = 'https://fakestoreapi.com/products/categories';
const String sortingDesc = 'https://fakestoreapi.com/products?sort=desc';
const String limitItem = 'limit=4';

class ProductAPI {
  Future<Product> fetchProduct() async {
    final response =
        await http.get(Uri.https('fakestoreapi.com', '/products/3'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Product');
    }
  }

  Future<dynamic> getListProduct() async {
    Network network = Network('$baseUrl');
    var dataProduk = await network.getProduct();
    return dataProduk;
  }

  Future<dynamic> loadMore() async {
    Network network = Network('$baseUrl');
    var dataProduk = await network.loadMore();
    return dataProduk;
  }

  
}
