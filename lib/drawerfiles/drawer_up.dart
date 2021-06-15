import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../namedata.dart';

class DrawerUp extends StatelessWidget {
  Widget build(BuildContext context) {
    String _name = Provider.of<NameData>(context).personName;

    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circle Avatar
          CircleAvatar(
            child: Text(
              (_name == 'Null') ? "X" : _name[0],
              style: TextStyle(
                fontSize: constraint.maxWidth * 0.17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Koho-Bold',
              ),
            ),
            radius: constraint.maxWidth * 0.18,
            backgroundColor: Color(0xFFEE7E55),
          ),

          SizedBox(
            height: constraint.maxHeight * 0.2,
          ),

          // Name Text
          FittedBox(
            child: Text(
              (_name == 'Null') ? "Loading...." : _name,
              style: TextStyle(
                fontSize: constraint.maxWidth * 0.12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                //fontFamily: 'Koho-Bold',
              ),
              maxLines: 1,
            ),
            fit: BoxFit.fill,
          ),
        ],
      );
    });
  }
}
