part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;
  CustomTabBar({@required this.selectedIndex, this.titles, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Row(
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap(titles.indexOf(e));
                              }
                            },
                            child: Text(
                              e,
                              style: (titles.indexOf(e) == selectedIndex)
                                  ? TextStyle(fontWeight: FontWeight.w500)
                                  : TextStyle(color: Color(0xFF585858)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                color: (titles.indexOf(e) == selectedIndex)
                                    ? Color(0xFF585858)
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
