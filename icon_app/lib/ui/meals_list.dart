import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icon_app/ui/details_screen/details_screen.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/curve_shape.dart';

import 'help/help.dart';

class MealsList extends StatefulWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  List<Map<String, String>> mealsListData = [
    {
      "image": "assets/images/broc.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
      "disc": "fLAFEL  MESHAKEL fLAFEL  MESHAKEL",
    },
    {
      "image": "assets/images/car.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
      "disc": "fLAFEL  MESHAKEL fLAFEL  MESHAKEL",
    },
    {
      "image": "assets/images/cardd.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
      "disc": "fLAFEL  MESHAKEL fLAFEL  MESHAKEL",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CurvedShape(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 25),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: kColorPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: kColorAccent,
                          child: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "FLAFEL MESHAKEL",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff303030).withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(-3, 5),
                ),
              ],
            ),
            child: TextFormField(
              // onSaved: (newValue) => search = newValue,
              // onChanged: (value) => print(value),
              // textInputAction: TextInputAction.go,
              // onFieldSubmitted: (_) {
              //   _submit();
              //   // Navigator.of(context).pushReplacement(
              //   //         MaterialPageRoute(builder: (context) => ));
              // },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: ("SEARCH"),
                  hintStyle: TextStyle(
                      color: Color(0xffD7D7D7),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  prefixIcon: Icon(
                    Icons.search,
                    color: kColorPrimary,
                    size: 28,
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mealsListData.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    helpNavigateTo(
                        context,
                        DetailsScreen(
                          image: mealsListData[index]["image"]!,
                          title: mealsListData[index]["title"]!,
                          price: mealsListData[index]["price"]!,
                        ));
                  },
                  child: Container(
                    //width: 200,
                    height: 180,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            mealsListData[index]["image"]!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 28),
                          child: Text(
                            mealsListData[index]["title"]!,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.all(7),
                          child: Text(
                            mealsListData[index]["disc"]!,
                            style:
                                TextStyle(color: kColorAccent, fontSize: 12.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(7),
                          child: Text(
                            mealsListData[index]["price"]!,
                            style:
                                TextStyle(color: kColorAccent, fontSize: 24.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
