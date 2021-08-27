import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/default_button.dart';
import 'package:icon_app/ui/help/help.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icon_app/ui/home_screens/home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
          child: Column(
            children: [
              Container(
                height: 80,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/w.png",
                          fit: BoxFit.fill,
                          // height: 190,
                          width: 80,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          Text(
                            "WORLDDESIGNDS .COM",
                            // textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
                        Icons.circle,
                        color: kColorPrimary,
                        size: 18,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  helpNavigateTo(context, HomeScreen());
                },
                child: Container(
                  height: 172,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Shormeh Alhafof",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "From - Kamieńskiego 11, Cracow",
                                style: TextStyle(
                                  color: Color(0xffD6D6D6),
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Bonarka City Center",
                                style: TextStyle(
                                    color: Color(0xffD5C48E),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Open 10:00 :  5:15 pm",
                                style: TextStyle(
                                  color: kColorPrimary,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            Container(
                              width: 110,
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: DefaultButton(
                                text: ("Order Naw"),
                                height: 20,
                                fontSize: 8,
                                radius: 12,
                                press: () {
                                  Navigator.pushNamed(context, 'home');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              "assets/images/logo.png",
                              fit: BoxFit.fill,
                              // height: 190,
                              width: 130,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
