import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/help.dart';

import 'navigation_bar.dart';

class FindFood extends StatefulWidget {
  @override
  _FindFoodState createState() => _FindFoodState();
}

class _FindFoodState extends State<FindFood> {
  String? lang;
  String? branch;
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"image": "assets/images/Deliveryvector.png"},
    {"image": "assets/images/Deliveryvector.png"},
    {"image": "assets/images/Deliveryvector.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => Image.asset(
                    splashData[index]["image"]!,
                    height: 80,
                    //width: 200,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        "Find Food You Love",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 16),
                      child: Text(
                        "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff7C7D7E)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Color(0xffDDDDDD),
                              )),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Select Language'),
                            value: lang,
                            isDense: true,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                  child: Text("Arabic"), value: "Arabic"),
                              DropdownMenuItem(
                                  child: Text("English"), value: "English"),
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                lang = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.50 - 25,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffDDDDDD),
                                  )),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('Branches'),
                                value: branch,
                                isDense: true,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                      child: Text("loc1"), value: "loc1"),
                                  DropdownMenuItem(
                                      child: Text("loc2"), value: "loc2"),
                                ],
                                onChanged: (newValue) {
                                  setState(() {
                                    branch = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            helpNavigateTo(context, NavigationBar());
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kColorPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundColor: kColorPrimary,
                              child: Icon(
                                Icons.location_on,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 8 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kColorPrimary : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
