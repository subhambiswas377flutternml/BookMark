import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomTile4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, //Color(0xFF25232C),
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
      ..color = Colors.black //Color(0xFF6C60E0)
      ..style = PaintingStyle.fill;

    //<Changing Part>

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0011000, size.height * 0.5285714);
    path_0.quadraticBezierTo(size.width * 0.2450000, size.height * 0.4657000,
        size.width * 0.3337000, size.height * 0.5016714);
    path_0.cubicTo(
        size.width * 0.5129000,
        size.height * 0.5794429,
        size.width * 0.5499667,
        size.height * 0.6032571,
        size.width * 0.6656333,
        size.height * 0.5715143);
    path_0.quadraticBezierTo(size.width * 0.8000000, size.height * 0.5381714,
        size.width, size.height * 0.5266143);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_0);

    //</Changing Part>
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
