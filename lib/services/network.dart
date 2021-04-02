import 'package:http/http.dart' as http;

class Network {
  final String url;
  Network(this.url);

  Future getProduct() async {
    print("memanggil url: $url");
    final response = await http.get(Uri.https(url, '/products'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getCart() async {
    print("memanggil url: $url");
    final response = await http.get(Uri.https(url, '/carts'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getCategory() async {
    print("memanggil url: $url");
    final response = await http.get(Uri.https(url, '/products/categories'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
