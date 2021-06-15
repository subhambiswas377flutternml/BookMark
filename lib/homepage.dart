import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './modedata.dart';
import './homescreen.dart';
import './splashscreen.dart';
import './namedata.dart';

class HomePage extends StatelessWidget {
  /*
  String _name;
  HomePage(this._name);
  */

  Widget build(BuildContext context) {
    //Provider.of<NameData>(context).setData(this._name);
    return FutureBuilder(
      future: Provider.of<ModeData>(context, listen: false).fetchAndSetMode(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? SplashScreen()
              : HomeScreen(),
    );
  }
}
