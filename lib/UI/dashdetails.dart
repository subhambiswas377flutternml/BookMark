import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/datatype.dart';
import './graph_ui2.dart';
import '../mydata.dart';
import 'package:provider/provider.dart';

class DashDetails extends StatelessWidget {
  DataType _newData;
  int _index;
  DashDetails(this._index);
  Widget build(BuildContext context) {
    _newData = Provider.of<MyData>(context).myList[this._index];
    return LayoutBuilder(builder: (context, constraint) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: constraint.maxWidth * 0.04,
          ),
          //Graph UI
          GraphUI2(_newData, constraint),

          SizedBox(width: constraint.maxWidth * 0.2),
          // Page Number
          Container(
            width: constraint.maxWidth * 0.2,
            child: FittedBox(
                child: Text(
                  _newData.currentPage,
                  style: TextStyle(
                    fontSize: constraint.maxWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobstar',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                fit: BoxFit.fitWidth),
          ),

          SizedBox(
            width: constraint.maxWidth * 0.1,
          ),
        ],
      );
    });
  }
}
