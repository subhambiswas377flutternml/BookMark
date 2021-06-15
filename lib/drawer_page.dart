import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './modedata.dart';
import './drawerfiles/drawer_up.dart';
import './drawerfiles/drawer_down.dart';

class DrawerPage extends StatelessWidget {
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context); // for height
    bool _darkmode = Provider.of<ModeData>(context).mode;

    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        color: Color(0xFF001A8F),
        height: _info.size.height,
        width: constraint.maxWidth,
        // Column for entire Drawer Screen
        child: Column(
          children: [
            SizedBox(
              height: _info.size.height * 0.055,
            ),
            // 1st Container for name section
            Container(
              width: constraint.maxWidth,
              height: constraint.maxHeight * 0.25,
              padding: EdgeInsets.only(
                left: constraint.maxWidth * 0.058,
                right: constraint.maxHeight * 0.04,
              ),
              child: DrawerUp(),
            ),

            SizedBox(
              height: _info.size.height * 0.05,
            ),

            // 2nd Container for ListView

            Container(
              //color: (_darkmode) ? Colors.black : Colors.white,

              decoration: BoxDecoration(
                color: (_darkmode) ? Colors.black : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  //topRight: Radius.circular(25),
                ),
              ),

              height: constraint.maxHeight * 0.645,
              width: constraint.maxWidth,
              child: DrawerDown(),
            ),
          ],
        ),
      );
    });
  }
}
