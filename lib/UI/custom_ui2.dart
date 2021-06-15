import 'package:bookmarkapp/modedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CustomTile2 extends StatelessWidget {
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
      ..color = Color(0xFFF98A6B)
      ..style = PaintingStyle.fill;

    //<Changing Part>

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.0714857);
    path_0.quadraticBezierTo(size.width * 0.1627000, size.height * 0.3907857,
        size.width * 0.4436333, size.height * 0.4306143);
    path_0.quadraticBezierTo(size.width * 0.8766333, size.height * 0.4797286,
        size.width, size.height * 0.3561000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.0005333, size.height);
    path_0.lineTo(0, size.height * 0.0714857);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    //</Changing Part>
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
