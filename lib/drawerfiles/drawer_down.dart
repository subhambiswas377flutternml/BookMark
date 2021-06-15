import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modedata.dart';
import 'package:flutter/cupertino.dart';
import '../addname.dart';

class DrawerDown extends StatefulWidget {
  State<StatefulWidget> createState() {
    return DrawerDownState();
  }
}

class DrawerDownState extends State<DrawerDown> {
  Widget build(BuildContext context) {
    bool _darkmode = Provider.of<ModeData>(context).mode;
    Function _change = Provider.of<ModeData>(context).darkMode;

    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: constraint.maxHeight * 0.15,
          ),
          ListTile(
            leading: (_darkmode)
                ? Icon(
                    Icons.nights_stay,
                    size: constraint.maxWidth * 0.1,
                    color: Colors.amber,
                  )
                : Icon(
                    Icons.wb_sunny,
                    size: constraint.maxWidth * 0.1,
                    color: Colors.deepOrange,
                  ),

            // Leading
            title: Text(
              "Dark Mode",
              style: TextStyle(
                  fontSize: constraint.maxWidth * 0.058,
                  color: (_darkmode) ? Colors.white : Colors.black),
            ),
            trailing: CupertinoSwitch(
              value: _darkmode,
              onChanged: (value) {
                setState(() {
                  _change(value);
                });
              },
            ),

            onTap: () {
              setState(() {
                _darkmode = !_darkmode;
                _change(_darkmode);
              });
            },
          ),

          SizedBox(
            height: constraint.maxHeight * 0.028,
          ),
          // Profile ListTile
          ListTile(
            title: Text(
              "Change Profile",
              style: TextStyle(
                  fontSize: constraint.maxWidth * 0.058,
                  color: (_darkmode) ? Colors.white : Colors.black),
            ),
            leading: Icon(
              Icons.account_circle,
              size: constraint.maxWidth * 0.1,
              color: (_darkmode) ? Colors.green : Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: (_darkmode) ? Colors.white : Colors.grey,
            ),
            onTap: () {
              // profile edit
              //Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pop(context);
              popUpField(context);
            },
          ),
        ],
      );
    });
  }
}
