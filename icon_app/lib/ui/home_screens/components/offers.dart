import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<Map<String, String>> offersData = [
    {"image": "assets/images/1.png"},
    {"image": "assets/images/2.png"},
    {"image": "assets/images/3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offersData.length,
        itemBuilder: (ctx, index) => Container(
              width: 320,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(offersData[index]["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ));
  }
}
