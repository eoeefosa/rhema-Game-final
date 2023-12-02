import 'package:flutter/material.dart';

const stargradient = LinearGradient(
  colors: [Colors.red, Colors.orange, Colors.yellow],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

Widget diamond({
  double size = 15,
}) {
  return Icon(
    Icons.diamond,
    size: size,
    color: Colors.yellow.shade900,
  );
}

const leveltitlestyle = TextStyle(color: Colors.black);
const LinearGradient levelcardgradient = LinearGradient(
  colors: [Color.fromRGBO(222, 201, 177, 1), Color.fromRGBO(226, 194, 157, 1)],
  // colors: [Colors.red, Colors.orange, Colors.yellow],

  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
