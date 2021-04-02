part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
          child: Column(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomTabBar(
                  titles: [
                    "All",
                    "Electronics",
                    "Jewelery",
                    "Men clothing",
                    "Women clothing"
                  ],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              )
            ],
          ),
          Container(
            height: 500,
            child: ListPorduct(),
          ),
        ],
      )),
    );
  }
}
