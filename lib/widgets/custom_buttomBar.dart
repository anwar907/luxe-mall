part of 'widgets.dart';

class CustomButtomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  CustomButtomNavBar({this.selectedIndex = 0, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
              width: 32,
              height: 32,
              child: SvgPicture.asset("assets/home.svg"),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
              width: 32,
              height: 32,
              child: SvgPicture.asset("assets/cart.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
