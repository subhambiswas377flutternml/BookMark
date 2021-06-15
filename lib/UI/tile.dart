import 'package:bookmarkapp/first_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../first_row.dart';
import '../second_row.dart';
import '../model/datatype.dart';
import '../modedata.dart';
import '../dashboard.dart';
import 'package:flutter/cupertino.dart';

class CardTile extends StatelessWidget {
  DataType _newData;
  int _index;
  CardTile(this._newData, this._index);

  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    bool _darkmode = Provider.of<ModeData>(context).mode;
    return Container(
      height: _info.size.height * 0.25,
      width: _info.size.width,
      margin: EdgeInsets.symmetric(
        vertical: _info.size.width * 0.02,
        horizontal: _info.size.height * 0.02,
      ),
      child: GestureDetector(
        child: Card(
          color: (_darkmode) ? Colors.white70 : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // Beginning Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1st element row
              FirstRow(this._newData),

              //2nd Element Row
              SecondRow(this._newData, this._index),
            ],
          ),
          elevation: 10,
          shadowColor:
              (_darkmode) ? Colors.white : Theme.of(context).primaryColor,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DashBoard(_index);
          }));
        },
        onLongPress: () {},
      ),
    );
  }
}
