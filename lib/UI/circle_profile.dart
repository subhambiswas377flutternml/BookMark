import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../namedata.dart';

class CircleProfile extends StatelessWidget {
  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    String _name = Provider.of<NameData>(context).personName;

    return CircleAvatar(
      radius: _info.size.width * 0.085,
      backgroundColor: Theme.of(context).accentColor,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: _info.size.width * 0.08,
        child: CircleAvatar(
          backgroundColor: Color(0xFFD4BF9D),
          child: FittedBox(
            child: Text(
              _name[0],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _info.size.width * 0.05,
                  fontFamily: 'Tangerine'),
            ),
            fit: BoxFit.fill,
          ),
          radius: _info.size.width * 0.07,
        ),
      ),
    );
  }
}
