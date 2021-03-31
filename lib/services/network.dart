import 'package:http/http.dart' as http;

class Network {
  final String url;
  Network(this.url);

  Future getProduct() async {
    print("memanggil url: $url");
    final response =
        await http.get(Uri.https(url, '/products', {'limit': '4'}));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future loadMore() async {
    print("memanggil url: $url");
    final response = await http.get(Uri.https(url, '/products'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
