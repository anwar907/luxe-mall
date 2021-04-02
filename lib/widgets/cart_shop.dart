part of 'widgets.dart';

class CartShop extends StatefulWidget {
  @override
  _CartShopState createState() => _CartShopState();
}

class _CartShopState extends State<CartShop> {
  ListCart listCart;
  final DateFormat formatDate = DateFormat.yMd().add_jm();

  void getCart() async {
    var data = await ProductAPI().getDataCart();
    var value = json.decode(data);
    setState(() {
      listCart = ListCart.fromJson(value);
    });
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: (listCart == null ||
                    listCart.cartList == null ||
                    listCart.cartList.length == 0)
                ? 0
                : listCart.cartList.length,
            itemBuilder: (context, value) {
              print(listCart.cartList[value].products.length);
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                height: 130,
                decoration: BoxDecoration(
                    color: Color(0xFFC2912E),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID = ${listCart.cartList[value].id}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("User Id =${listCart.cartList[value].userId}",
                        style: TextStyle(color: Colors.white)),
                    Text("Date = ${listCart.cartList[value].date}",
                        style: TextStyle(color: Colors.white)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listCart.cartList[value].products.length,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Produk ID= ${listCart.cartList[value].products[index].productId}",
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                    "Quantity = ${listCart.cartList[value].products[index].quantity}",
                                    style: TextStyle(color: Colors.white))
                              ]);
                        })
                  ],
                ),
              );
            }));
  }
}
