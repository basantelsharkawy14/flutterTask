
import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';


import 'components/meals.dart';
import 'components/offers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimary,
        title: Text(
          "Shormeh Alhafof",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 25),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: kColorPrimary,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: kColorAccent,
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 210,
                child: Offers(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 300,
                child: Meals(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
