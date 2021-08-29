import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_app/ui/help/constants.dart';
import 'package:icon_app/ui/help/default_button.dart';
import 'package:icon_app/ui/help/help.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icon_app/ui/home_screens/home_screen.dart';
import 'dart:ui' as ui;


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key ,required this.loc}) : super(key: key);
  final String loc;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var markers = HashSet<Marker>();
    late BitmapDescriptor mapMarker;
  bool isSelected = false;
  bool isSelected2 = false;

   void setCustomMarker () async{
     final Uint8List markerIcon = await getBytesFromAsset('assets/images/lo.png', 200);
     mapMarker =  BitmapDescriptor.fromBytes(markerIcon);

   }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
double lang1 = 0;
   double lat1 = 0;
  double lang2 = 0;
  double lat2 = 0;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }
  
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    if(widget.loc == "Riyadh"){
      lang1 = 24.774265;
      lat1 = 46.738586;

      lang2 = 24.78748;
      lat2 = 46.73184;
    }
    else  if(widget.loc == "Jeddah"){
      lang1 = 39.1828;
      lat1 = 21.4817;

      lat2 = 21.46758;
      lang2 = 39.23139;
    }
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat2,lang2),
              zoom: 12.3,),

            onMapCreated: (GoogleMapController controller) {
              setState(() {

                markers.add(Marker(markerId: MarkerId('1'), position: LatLng(lat1,lang1), icon: mapMarker,onTap: (){setState(() {isSelected=true; isSelected2 = false;

                });} ),);
                markers.add(Marker(markerId: MarkerId('2'), position: LatLng(lat2, lang2), icon: mapMarker, onTap: (){setState(() {
                  isSelected = false;  isSelected2 = true;
                });}),);
              });

              _controller.complete(controller);
            },
            // onMapCreated: (GoogleMapController controller) {
            //   _controller.complete(controller);
            //  },
            markers: markers,

          ),
          Container(
            width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
    child: Container(
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
                              TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          "WORLDDESIGNDS .COM",
                          // textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ),

          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 130),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
            child: Row(
              children: [
                Icon(  Icons.circle,
                                color: kColorPrimary,
                                size: 18,),
                SizedBox(width: 10,),
                Text(widget.loc,style: TextStyle(
                        fontSize: 16,),)
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Visibility(
              visible: isSelected,
              child: GestureDetector(
                        onTap: () {
                          helpNavigateTo(context, HomeScreen());
                        },
                        child: Container(
                          height: 172,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                               // flex: 2,
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
                                        color:  kColorPrimary,
                                        text: ("Order Naw"),
                                        height: 30,
                                        fontSize: 11,
                                        radius: 12,
                                        press: () {
                                          Navigator.pushNamed(context, 'home');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.asset(
                                    "assets/images/g.png",
                                    fit: BoxFit.fill,
                                    // height: 190,
                                    width: 140,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Visibility(
              visible: isSelected2,
              child: GestureDetector(
                onTap: () {
                  helpNavigateTo(context, HomeScreen());
                },
                child: Container(
                  height: 172,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Shormeh Alhafof",
                                style: TextStyle(
                                    color:  Color(0xffE20000),
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
                                "Closed",
                                style: TextStyle(
                                  color: Color(0xffE20000),
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
                                text: ("Closed naw "),
                                height: 30,
                                color:  Color(0xffE20000),
                                fontSize: 11,
                                radius: 12,
                                press: () {
                                 // Navigator.pushNamed(context, 'home');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            "assets/images/g.png",
                            fit: BoxFit.fill,
                            // height: 190,
                            width: 140,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ],
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
