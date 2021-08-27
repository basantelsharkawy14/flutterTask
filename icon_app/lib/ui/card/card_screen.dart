import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/curve_shape.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<Map<String, String>> cardListData = [
    {
      "image": "assets/images/broccoli.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
    },
    {
      "image": "assets/images/broccoli.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
    },
    {
      "image": "assets/images/broccoli.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
    },
    {
      "image": "assets/images/broccoli.png",
      "title": "fLAFEL  MESHAKEL",
      "price": "60 RS",
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
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        "My Card",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardListData.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: GestureDetector(
                    onTap: () {},
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.20,
                      secondaryActions: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: new IconSlideAction(
                            color: kColorAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            // onTap: () => _showSnackBar('More'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: new IconSlideAction(
                            color: Colors.red,
                            icon: Icons.delete,
                            //   onTap: () => _showSnackBar('Delete'),
                          ),
                        ),
                      ],
                      child: new Container(
                        height: 60,
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xffF2F2F2),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.asset(
                                cardListData[index]["image"]!,
                                fit: BoxFit.fill,
                                height: 46,
                                width: 46,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              cardListData[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 14),
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  Text(
                                    cardListData[index]["price"]!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  Text(
                                    "2:price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kColorPrimary, fontSize: 9.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20),
              // flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub-total",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 16.0),
                        ),
                        Text(
                          "£9.30",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 16.0),
                        ),
                        Text(
                          "Standard (free)",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 24.0),
                        ),
                        Text(
                          "£9.30",
                          style: TextStyle(
                              color: Color(0xff748A9D), fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 14),
                    child: Container(
                      height: (56),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: kColorPrimary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: (16),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
