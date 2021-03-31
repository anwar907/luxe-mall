part of 'widgets.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = ProductAPI().fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Container(
                      color: Colors.white,
                    ),
                    SafeArea(
                        child: Container(
                      color: Color(0xFF585858),
                    )),
                    SafeArea(
                        child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(snapshot.data.image)),
                            ))),
                    SafeArea(
                        child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 230),
                              padding: EdgeInsets.all(8.0),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xFFC2912E),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Text(
                                snapshot.data.title,
                                maxLines: 3,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  color: Color(0xFF585858),
                                  padding: EdgeInsets.symmetric(horizontal: 26),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    minVerticalPadding: 0,
                                    title: Text(
                                      "Category: ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    minLeadingWidth: 0,
                                    subtitle: Text(
                                      snapshot.data.category,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Text(
                                      "IDR.${snapshot.data.price}",
                                      maxLines: 9,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )),
                            ),
                            Container(
                              color: Color(0xFF585858),
                              padding: EdgeInsets.symmetric(horizontal: 26),
                              child: Text(
                                snapshot.data.description,
                                maxLines: 9,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(3),
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                    child: Icon(Icons.arrow_back_ios,
                                        color: Color(0xFFC2912E)),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.all(3),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.local_grocery_store,
                                        color: Color(0xFFC2912E),
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC2912E)),
              );
            }),
      ),
    );
  }
}
