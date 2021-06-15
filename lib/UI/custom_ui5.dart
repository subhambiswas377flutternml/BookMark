import 'package:bookmarkapp/modedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CustomTile5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    bool _darkmode = Provider.of<ModeData>(context).mode;

    return Scaffold(
      backgroundColor: (_darkmode) ? Colors.black87 : Colors.white,
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
      ..color = Color(0xFF96C659)
      ..style = PaintingStyle.fill;

    //<Changing Part>

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0084000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.0006667, size.height);
    path_0.lineTo(size.width * 0.0004000, size.height * 0.4640000);
    path_0.quadraticBezierTo(size.width * 0.2553333, size.height * 0.6006143,
        size.width * 0.6371000, size.height * 0.5501429);
    path_0.cubicTo(
        size.width * 0.9724333,
        size.height * 0.4991143,
        size.width * 0.7475667,
        size.height * 0.3527714,
        size.width * 0.8202000,
        size.height * 0.1443571);
    path_0.quadraticBezierTo(size.width * 0.8506667, size.height * 0.0765571,
        size.width, size.height * 0.0102286);

    canvas.drawPath(path_0, paint_0);

    //</Changing Part>
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
