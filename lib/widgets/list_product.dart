part of 'widgets.dart';

class ListPorduct extends StatefulWidget {
  @override
  _ListPorductState createState() => _ListPorductState();
}

class _ListPorductState extends State<ListPorduct> {
  ProductList listProduct = ProductList();

  void getProduct() async {
    var result = await ProductAPI().getListProduct();

    var value = json.decode(result);
    setState(() {
      listProduct = ProductList.fromJson(value);
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
            scrollDirection: Axis.vertical,
            itemCount: (listProduct == null ||
                    listProduct.produkList == null ||
                    listProduct.produkList.length == 0)
                ? 0
                : listProduct.produkList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPages()));
                  },
                  child: Container(
                    height: 150,
                    // color: Colors.yellow,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Container(
                            height: 150,
                            width: 100,
                            child: Image(
                                image: NetworkImage(
                                    listProduct.produkList[index].image)),
                          ),
                          title: Text(
                            "${listProduct.produkList[index].title}",
                          ),
                          subtitle:
                              Text(listProduct.produkList[index].category),
                          trailing:
                              Text("Rp.${listProduct.produkList[index].price}"),
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
