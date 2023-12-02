import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0.5220875, size.height * 0.5376509);
    path.cubicTo(size.width * 0.5220875, size.height * 0.5549599,
        size.width * 0.5360658, size.height * 0.5691660,
        size.width * 0.5533748, size.height * 0.5691660);
    path.lineTo(size.width * 0.7378891, size.height * 0.5691660);
    path.cubicTo(size.width * 0.7480031, size.height * 0.5691660,
        size.width * 0.7575006, size.height * 0.5641077,
        size.width * 0.7633851, size.height * 0.5558767);
    path.cubicTo(size.width * 0.7692696, size.height * 0.5476483,
        size.width * 0.7708184, size.height * 0.5369982,
        size.width * 0.7675447, size.height * 0.5274255);
    path.lineTo(size.width * 0.7423232, size.height * 0.4535587);
    path.lineTo(size.width * 0.7674825, size.height * 0.3814478);
    path.cubicTo(size.width * 0.7708262, size.height * 0.3718622,
        size.width * 0.7693188, size.height * 0.3612484,
        size.width * 0.7634395, size.height * 0.3529733);
    path.cubicTo(size.width * 0.7575602, size.height * 0.3446957,
        size.width * 0.7480394, size.height * 0.3397773,
        size.width * 0.7378891, size.height * 0.3397773);
    path.lineTo(size.width * 0.7107770, size.height * 0.3397773);
    path.cubicTo(size.width * 0.7063766, size.height * 0.3535509,
        size.width * 0.7019762, size.height * 0.3676172,
        size.width * 0.6976509, size.height * 0.3814478);
    path.lineTo(size.width * 0.6975654, size.height * 0.3817198);
    path.cubicTo(size.width * 0.6886221, size.height * 0.4103004,
        size.width * 0.6793758, size.height * 0.4398550,
        size.width * 0.6701191, size.height * 0.4668894);
    path.cubicTo(size.width * 0.6603989, size.height * 0.4952784,
        size.width * 0.6337115, size.height * 0.5143538,
        size.width * 0.6037141, size.height * 0.5143538);
    path.cubicTo(size.width * 0.5959725, size.height * 0.5143538,
        size.width * 0.5883191, size.height * 0.5130769,
        size.width * 0.5809790, size.height * 0.5105594);
    path.cubicTo(size.width * 0.5616395, size.height * 0.5039368,
        size.width * 0.5418803, size.height * 0.4983269,
        size.width * 0.5220850, size.height * 0.4937063);
    path.lineTo(size.width * 0.5220850, size.height * 0.5376509);
    path.close();

    path.moveTo(size.width * 0.6037192, size.height * 0.4755012);
    path.cubicTo(size.width * 0.6167470, size.height * 0.4755012,
        size.width * 0.6289122, size.height * 0.4673142,
        size.width * 0.6333696, size.height * 0.4543020);
    path.cubicTo(size.width * 0.6424864, size.height * 0.4276742,
        size.width * 0.6516809, size.height * 0.3982776,
        size.width * 0.6605776, size.height * 0.3698472);
    path.cubicTo(size.width * 0.6693447, size.height * 0.3418182,
        size.width * 0.6784123, size.height * 0.3128309,
        size.width * 0.6872520, size.height * 0.2869982);
    path.cubicTo(size.width * 0.6899456, size.height * 0.2791323,
        size.width * 0.6894043, size.height * 0.2705206,
        size.width * 0.6857498, size.height * 0.2630588);
    path.cubicTo(size.width * 0.6820901, size.height * 0.2555918,
        size.width * 0.6756203, size.height * 0.2498860,
        size.width * 0.6677571, size.height * 0.2471924);
    path.cubicTo(size.width * 0.5764206, size.height * 0.2159233,
        size.width * 0.4811577, size.height * 0.2000648,
        size.width * 0.3846180, size.height * 0.2000648);
    path.cubicTo(size.width * 0.2880782, size.height * 0.2000673,
        size.width * 0.1928153, size.height * 0.2159233,
        size.width * 0.1014815, size.height * 0.2471924);
    path.cubicTo(size.width * 0.09361564, size.height * 0.2498860,
        size.width * 0.08714323, size.height * 0.2555918,
        size.width * 0.08348614, size.height * 0.2630588);
    path.cubicTo(size.width * 0.07982906, size.height * 0.2705206,
        size.width * 0.07929034, size.height * 0.2791323,
        size.width * 0.08198394, size.height * 0.2869982);
    path.cubicTo(size.width * 0.09082362, size.height * 0.3128309,
        size.width * 0.09989381, size.height * 0.3418182,
        size.width * 0.1086610, size.height * 0.3698472);
    path.cubicTo(size.width * 0.1175550, size.height * 0.3982802,
        size.width * 0.1267495, size.height * 0.4276742,
        size.width * 0.1358664, size.height * 0.4543020);
    path.cubicTo(size.width * 0.1403212, size.height * 0.4673168,
        size.width * 0.1524916, size.height * 0.4755012,
        size.width * 0.1655141, size.height * 0.4755012);
    path.cubicTo(size.width * 0.1688837, size.height * 0.4755012,
        size.width * 0.1723051, size.height * 0.4749547,
        size.width * 0.1756695, size.height * 0.4738021);
    path.cubicTo(size.width * 0.2430743, size.height * 0.4507252,
        size.width * 0.3133748, size.height * 0.4390262,
        size.width * 0.3846206, size.height * 0.4390262);
    path.cubicTo(size.width * 0.4558664, size.height * 0.4390262,
        size.width * 0.5261668, size.height * 0.4507278,
        size.width * 0.5935716, size.height * 0.4738021);
    path.cubicTo(size.width * 0.5969283, size.height * 0.4749521,
        size.width * 0.6003522, size.height * 0.4755012,
        size.width * 0.6037192, size.height * 0.4755012);
    path.close();

    path.moveTo(size.width * 0.2447863, size.height * 0.4943201);
    path.cubicTo(size.width * 0.2258612, size.height * 0.4988241,
        size.width * 0.2067625, size.height * 0.5042191,
        size.width * 0.1882569, size.height * 0.5105543);
    path.cubicTo(size.width * 0.1809039, size.height * 0.5130743,
        size.width * 0.1732505, size.height * 0.5143512,
        size.width * 0.1655115, size.height * 0.5143512);
    path.cubicTo(size.width * 0.1355089, size.height * 0.5143512,
        size.width * 0.1088215, size.height * 0.4952758,
        size.width * 0.09910904, size.height * 0.4668868);
    path.cubicTo(size.width * 0.08982647, size.height * 0.4397747,
        size.width * 0.08055426, size.height * 0.4101321,
        size.width * 0.07154882, size.height * 0.3813442);
    path.cubicTo(size.width * 0.06723129, size.height * 0.3675421,
        size.width * 0.06284123, size.height * 0.3535095,
        size.width * 0.05845118, size.height * 0.3397747);
    path.lineTo(size.width * 0.03134162, size.height * 0.3397747);
    path.cubicTo(size.width * 0.02118881, size.height * 0.3397747,
        size.width * 0.01166796, size.height * 0.3446957,
        size.width * 0.005788656, size.height * 0.3529707);
    path.cubicTo(size.width * -0.00009065009, size.height * 0.3612458,
        size.width * -0.001595442, size.height * 0.3718570,
        size.width * 0.001748252, size.height * 0.3814452);
    path.lineTo(size.width * 0.02690495, size.height * 0.4535587);
    path.lineTo(size.width * 0.001683502, size.height * 0.5273349);
    path.cubicTo(size.width * -0.001590262, size.height * 0.5369075,
        size.width * -0.00003885004, size.height * 0.5476483,
        size.width * 0.005843046, size.height * 0.5558767);
    path.cubicTo(size.width * 0.01172753, size.height * 0.5641077,
        size.width * 0.02122248, size.height * 0.5691660,
        size.width * 0.03134162, size.height * 0.5691660);
    path.lineTo(size.width * 0.2134421, size.height * 0.5691660);
    path.cubicTo(size.width * 0.2307511, size.height * 0.5691660,
        size.width * 0.2447837, size.height * 0.5549573,
        size.width * 0.2447837, size.height * 0.5376509);
    path.lineTo(size.width * 0.2447837, size.height * 0.4943201);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Clipper Example'),
//         ),
//         body: ClipPath(
//           clipper: RPSCustomClipper(),
//           child: Container(
//             color: Colors.black, // Change the color to your desired background color
//           ),
//         ),
//       ),
//     ),
//   );
// }
