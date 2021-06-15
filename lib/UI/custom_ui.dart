import 'package:bookmarkapp/modedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CustomTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    //bool _darkmode = Provider.of<ModeData>(context).mode;

    return Scaffold(
      //backgroundColor: (_darkmode) ? Colors.black87 : Colors.white,
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
      ..color = Color(0xFF6C60E0)
      ..style = PaintingStyle.fill;

    //<Changing Part>

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0000286, size.height * 0.0001000);
    path_0.quadraticBezierTo(size.width * 0.1210857, size.height * 0.0950200,
        size.width * 0.1225143, size.height * 0.3958800);
    path_0.cubicTo(
        size.width * 0.1227714,
        size.height * 0.5209400,
        size.width * 0.0676571,
        size.height * 0.6047400,
        size.width * 0.0912286,
        size.height * 0.7020000);
    path_0.cubicTo(
        size.width * 0.1196000,
        size.height * 0.8060000,
        size.width * 0.1631714,
        size.height * 0.8341800,
        size.width * 0.2849714,
        size.height * 0.8503200);
    path_0.quadraticBezierTo(size.width * 0.9681143, size.height * 0.9167600,
        size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_0);

    //</Changing Part>
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
