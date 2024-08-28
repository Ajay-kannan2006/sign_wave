import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;

  const BackArrowButton({
    Key? key,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: iconSize),
        color: iconColor,
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
      ),
    );
  }
}
