import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icon_app/ui/branches_screen/branches_screen.dart';
import 'package:icon_app/ui/find_food_screen.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/home_screens/home_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key, required this.loc}) : super(key: key);
  final String loc;

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          onGenerateRoute: (settings) {
            Widget page = MapScreen(loc: widget.loc,);
            if (settings.name == 'home') page = HomeScreen();
            return MaterialPageRoute(builder: (_) => page);
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          height: 50,
          items: <Widget>[
            Icon(
              Icons.grid_view,
              size: 30,
              color: Color(0xffB6B7B7),
            ),
            Icon(
              Icons.shopping_bag_rounded,
              size: 30,
              color: Color(0xffB6B7B7),
            ),
            Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Color(0xffB6B7B7),
            ),
            Icon(
              Icons.read_more_outlined,
              size: 30,
              color: Color(0xffB6B7B7),
            ),
          ],
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: kColorPrimary,
          onTap: (index) {
            setState(() {});
          },
        ));
  }
}
