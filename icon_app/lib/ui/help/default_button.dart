import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.height,
    required this.fontSize,
    required this.radius
  }) : super(key: key);
  final String text;
  final GestureTapCancelCallback press;
  final double height;
  final double fontSize;
  final double radius;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (height),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        color: kColorPrimary,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: (fontSize),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
