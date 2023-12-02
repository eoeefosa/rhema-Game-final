import 'package:flutter/material.dart';

const double kfontsize = 30;
const double kdialogyfontsize = 23;
const double kdialogspacing = 10;
const double kexiticonsize = 30;

const double kiconsize = 30;
const double kiconpadding = 16;
const kcardshape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)));

const kwhitecolor = Color.fromARGB(255, 230, 233, 243);
const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

const greengradient = LinearGradient(
  colors: [Color.fromRGBO(158, 254, 22, 1), Colors.green],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const stargradient = LinearGradient(
  colors: [Colors.red, Colors.orange, Colors.yellow],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const leveltitlestyle = TextStyle(color: Colors.black);
const LinearGradient levelcardgradient = LinearGradient(
  colors: [Color.fromRGBO(222, 201, 177, 1), Color.fromRGBO(226, 194, 157, 1)],
  // colors: [Colors.red, Colors.orange, Colors.yellow],

  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const transparentgradient = LinearGradient(
  colors: [Colors.transparent, Colors.transparent],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const redgradient = LinearGradient(
  colors: [Color.fromRGBO(234, 145, 5, 1), Colors.red],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
