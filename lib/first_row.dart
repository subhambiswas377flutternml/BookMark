import 'package:flutter/material.dart';
import './model/datatype.dart';

class FirstRow extends StatelessWidget {
  DataType _newData;
  FirstRow(this._newData);
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Row(
        children: [
          // First Star
          Container(
            width: constraint.maxWidth * 0.1,
            margin: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.04,
            ),
            child: FittedBox(
              child: Icon(
                Icons.star,
              ),
              fit: BoxFit.contain,
            ),
          ),

          //Bookname
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.02,
            ),
            width: constraint.maxWidth * 0.6,
            child: Center(
              child: FittedBox(
                child: Text(
                  _newData.bookName,
                  style: TextStyle(
                    fontSize: constraint.maxWidth * 0.058,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobstar',
                  ),
                  maxLines: 1,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),

          //Second Star
          Container(
            width: constraint.maxWidth * 0.1,
            margin: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.04,
            ),
            child: FittedBox(
              child: Icon(
                Icons.star,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ],
      );
    });
  }
}
