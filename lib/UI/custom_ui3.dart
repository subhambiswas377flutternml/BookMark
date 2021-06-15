import 'package:bookmarkapp/modedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CustomTile3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    bool _darkmode = Provider.of<ModeData>(context).mode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          height: _info.size.height,
          width: _info.size.width,
          child: ListView(
            children: [
              Center(
                child: CustomPaint(
                  size: Size(_info.size.width,
                      (_info.size.height - _info.padding.top)),
                  painter: CurvedPainter(),
                ),
              ),
            ],
          )),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint_0 = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    //<Changing Part>

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.4733429);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.0017667, size.height);
    path_0.lineTo(size.width * 0.0005333, size.height * 0.6463286);
    path_0.quadraticBezierTo(size.width * 0.2811333, size.height * 0.9048286,
        size.width * 0.6934333, size.height * 0.7751429);
    path_0.quadraticBezierTo(size.width * 0.9048333, size.height * 0.7015714,
        size.width * 0.9810000, size.height * 0.5314143);

    canvas.drawPath(path_0, paint_0);

    //</Changing Part>
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
