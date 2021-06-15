import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/datatype.dart';
import 'package:provider/provider.dart';
import '../mydata.dart';

class DashName extends StatelessWidget {
  DataType _newData;
  int _index;
  DashName(this._index);
  Widget build(BuildContext context) {
    _newData = Provider.of<MyData>(context).myList[this._index];
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Book Name
          FittedBox(
            child: Text(
              // final String = " "+stringText+"    "
              "  " + _newData.bookName + "    ",
              style: TextStyle(
                fontSize: constraint.maxWidth * 0.12,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: 'Koho-Bold',
              ),
            ),
            fit: BoxFit.fill,
          ),

          Container(
            padding: EdgeInsets.only(
              left: constraint.maxWidth * 0.54,
            ),
            // Author Name
            child: FittedBox(
              child: Text(
                // final String = " "+stringText+"  "
                " " + _newData.authorName + "  ",
                style: TextStyle(
                  fontSize: constraint.maxWidth * 0.08,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Satisfy',
                ),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ],
      );
    });
  }
}
