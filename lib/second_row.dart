import 'package:flutter/material.dart';
import './UI/graph_ui.dart';
import './UI/func_button.dart';
import './UI/nametag.dart';
import './model/datatype.dart';
import 'package:flutter/cupertino.dart';

class SecondRow extends StatelessWidget {
  DataType _newData;
  int _index;
  SecondRow(this._newData, this._index);
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      //pass
      return Row(
        children: [
          SizedBox(
            width: constraint.maxWidth * 0.02,
          ),
          GraphUI(_newData, constraint),
          SizedBox(
            width: constraint.maxWidth * 0.11,
          ),
          NameTag(_newData, constraint),
          SizedBox(
            width: constraint.maxWidth * 0.028,
          ),
          FunctionButton(_newData, constraint, this._index),
        ],
      );
    });
  }
}
