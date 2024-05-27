import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String text;
  CustomHeading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
    );
  }
}


class CustomSubHeading extends StatelessWidget {
  final String text;
  CustomSubHeading({required this.text});

  @override
  Widget build(BuildContext context) {
   return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.black54),
    );
  }
}
