import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icon_app/ui/help/help.dart';
import 'package:icon_app/ui/meals_list.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  List<Map<String, String>> mealsData = [
    {"image": "assets/images/re.png", "text": "fLAFEL  MESHAKEL"},
    {"image": "assets/images/br.png", "text": "fLAFEL  MESHAKEL"},
    {"image": "assets/images/d.png", "text": "fLAFEL  MESHAKEL"},
    {"image": "assets/images/card.png", "text": "fLAFEL  MESHAKEL"},
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      staggeredTileBuilder: (_) => StaggeredTile.extent(1, 230),
      itemCount: mealsData.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            helpNavigateTo(context, MealsList());
          },
          child: Container(
            width: 200,
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    mealsData[index]["image"]!,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(7),
                  child: Text(
                    mealsData[index]["text"]!,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
