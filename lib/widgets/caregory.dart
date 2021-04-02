part of 'widgets.dart';

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Future<Category> category;

  @override
  void initState() {
    super.initState();
    category = ProductAPI().category();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
        future: category,
        builder: (context, snapshot) {
          print(snapshot.data.electronics);
          if (snapshot.hasData) { 
            return Text(snapshot.data.jewelery);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC2912E)),
          );
        });
  }
}
