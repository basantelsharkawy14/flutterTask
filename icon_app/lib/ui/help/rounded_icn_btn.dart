import 'package:flutter/material.dart';
import 'package:icon_app/ui/help/constants.dart';



class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key ? key,
    required this.icon,
    required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (33),
      width: (52),
      decoration: BoxDecoration(

        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: kColorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: press,
        child: Icon(icon, color: Colors.white,size: 18,),
      ),
    );
  }
}
