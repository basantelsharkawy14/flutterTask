import 'package:flutter/material.dart';

void helpNavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));