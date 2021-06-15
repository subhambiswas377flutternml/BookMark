import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../model/datatype.dart';

class GraphUI extends StatelessWidget {
  DataType _newData;
  var _constraint;
  GraphUI(this._newData, this._constraint);

  Widget build(BuildContext context) {
    //List _list = Provider.of<MyData>(context).myList;
    double _percent =
        (int.parse(_newData.currentPage) / int.parse(_newData.totalPage));
    int _per = (_percent * 100).toInt();
    return Container(
      //margin
      margin: EdgeInsets.symmetric(
        horizontal: _constraint.maxWidth * 0.04,
      ),
      // child
      child: CircularPercentIndicator(
        radius: _constraint.maxWidth * 0.2,
        lineWidth: _constraint.maxWidth * 0.012,
        percent: _percent,
        center: Text(
          "$_per%",
          style: TextStyle(
            fontSize: _constraint.maxWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        progressColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
