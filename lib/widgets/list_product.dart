part of 'widgets.dart';

class ListPorduct extends StatefulWidget {
  @override
  _ListPorductState createState() => _ListPorductState();
}

class _ListPorductState extends State<ListPorduct> {
  ProductList listProduct = ProductList();
  bool isLoading = false;
  String nextPage = "=fakestoreapi.com";

  void getProduct() async {
    var result = await ProductAPI().getListProduct();

    var value = json.decode(result);
    setState(() {
      listProduct = ProductList.fromJson(value);
      for (int i = 0; i < listProduct.produkList.length; i++) {}
    });
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: (listProduct == null ||
                    listProduct.produkList == null ||
                    listProduct.produkList.length == 0)
                ? 0
                : listProduct.produkList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Container(
                height: 140,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("${listProduct.produkList[index].title}"),
                      subtitle: Text(listProduct.produkList[index].category),
                      trailing:
                          Text("Rp.${listProduct.produkList[index].price}"),
                      leading: Container(
                        height: 140,
                        width: 100,
                        child: Image(
                            image: NetworkImage(
                                listProduct.produkList[index].image)),
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      height: 1,
                      color: Color(0xFFC2912E),
                    )
                  ],
                ),
              ));
            }));
  }
}
