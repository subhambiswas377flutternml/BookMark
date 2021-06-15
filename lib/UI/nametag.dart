import 'package:flutter/material.dart';
import '../model/datatype.dart';

class NameTag extends StatelessWidget {
  int _val = 1;
  DataType _newData;
  var _constraint;
  NameTag(this._newData, this._constraint);

  Widget build(BuildContext context) {
    //List _list = Provider.of<MyData>(context).myList;
    String _data = _newData.currentPage;
    _data = '  .     ' + _data;
    return Container(
      //margin

      width: _constraint.maxWidth * 0.4,
      //child
      child: Center(
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Book Icon
            Icon(
              Icons.auto_stories,
              size: _constraint.maxWidth * 0.055,
            ),

            // Space Between
            SizedBox(
              width: _constraint.maxWidth * 0.02,
            ),

            // Page Number
            Text(
              _data,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: _constraint.maxWidth * 0.04,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobstar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
