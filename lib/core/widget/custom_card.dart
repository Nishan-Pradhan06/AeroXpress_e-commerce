import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[300]!)),
      child: child,
    );
  }
}
