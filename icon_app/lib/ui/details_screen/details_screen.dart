import 'package:flutter/material.dart';
import 'package:icon_app/ui/card/card_screen.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/curve_shape.dart';
import 'package:icon_app/ui/help/default_button.dart';
import 'package:icon_app/ui/help/help.dart';
import 'package:icon_app/ui/help/rounded_icn_btn.dart';

class DetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const DetailsScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int? _option1;
  int counter = 1;
  bool _check1 = false;
  bool _check2 = false;
  bool _check3 = false;
  bool _fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CurvedShape(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.0),
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
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _fav = !_fav;
                      });
                    },
                    icon: Icon(
                      _fav ? Icons.favorite : Icons.favorite_border,
                    ),
                    iconSize: 30,
                    color: kColorPrimary)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fill,
                  height: 190,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                "Fits normal size. Designed for loose fit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff919191),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                widget.price,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 14.0, left: 14.0, bottom: 25, top: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customize your Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "one choice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffFF0101),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _option1 = 0;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color:
                          _option1 == 0 ? Color(0xffFF0101) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _option1 = 1;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color:
                          _option1 == 1 ? Color(0xffFF0101) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _option1 = 2;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color:
                          _option1 == 2 ? Color(0xffFF0101) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 14.0, left: 14.0, bottom: 25, top: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customize your Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Multiple choice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffFEC42D),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _check1 = !_check1;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: _check1 ? Color(0xffFEC42D) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _check2 = !_check2;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: _check2 ? Color(0xffFEC42D) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _check3 = !_check3;
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Select the size of portion -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: _check3 ? Color(0xffFEC42D) : Color(0xffD1D1D1),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 18),
              child: Text(
                "Notes",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              //   color: Color(0xffDDDDDD),
              // ),
              child: TextFormField(
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    fillColor: Colors.white,
                    focusedBorder: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 3.0)),
                    labelText: 'Add notes ',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 14.0, left: 14.0, bottom: 25, top: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Number of Portions",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  RoundedIconBtn(
                    icon: Icons.remove,
                    press: () {
                      setState(() {
                        if (counter > 1) counter--;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    height: 33,
                    width: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: kColorPrimary)),
                    child: Text(
                      counter.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 10),
                  RoundedIconBtn(
                    icon: Icons.add,
                    showShadow: true,
                    press: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: DefaultButton(
                text: ("Next"),
                height: 56,
                fontSize: 18,
                radius: 28,
                press: () {
                  helpNavigateTo(context, CardScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
