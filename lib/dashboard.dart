import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/datatype.dart';
import './modedata.dart';
import './UI/dashdetails.dart';
import './UI/dashname.dart';
import './UI/custom_ui2.dart';
import './UI/custom_ui3.dart';
import './editor.dart';
import './mydata.dart';

class DashBoard extends StatelessWidget {
  DataType _newData;
  int _index;
  DashBoard(this._index);
  Widget build(BuildContext context) {
    bool _mode = Provider.of<ModeData>(context).mode;
    MediaQueryData _info = MediaQuery.of(context);
    bool _darkmode = Provider.of<ModeData>(context).mode;
    _newData = Provider.of<MyData>(context).myList[this._index];

    return Scaffold(
      body: Stack(
        children: [
          // BackGround UI
          CustomTile2(),
          CustomTile3(),

          //ForeGround UI
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Container(
                  padding: EdgeInsets.only(
                    top: _info.size.height * 0.05,
                    left: _info.size.width * 0.07,
                    right: _info.size.width * 0.04,
                  ),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: (_darkmode) ? Colors.white : Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: _info.size.height * 0.04,
                ),

                // Name Container
                Container(
                  width: _info.size.width,
                  height: _info.size.height * 0.28,
                  margin: EdgeInsets.symmetric(
                    horizontal: _info.size.width * 0.028,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DashName(this._index),
                ),

                SizedBox(
                  height: _info.size.height * 0.058,
                ),

                // Details Container
                Container(
                  width: _info.size.width,
                  height: _info.size.height * 0.28,
                  margin: EdgeInsets.symmetric(
                    horizontal: _info.size.width * 0.028,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DashDetails(this._index),
                ),

                SizedBox(
                  height: _info.size.height * 0.04,
                ),
                // Update Button
                Container(
                  width: _info.size.width,
                  height: _info.size.height * 0.07,
                  margin: EdgeInsets.symmetric(
                    vertical: _info.size.height * 0.05,
                    horizontal: _info.size.width * 0.1,
                  ),
                  child: RaisedButton(
                    child: FittedBox(
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: _info.size.width * 0.05,
                            fontFamily: 'Koho-Bold'),
                      ),
                    ),
                    onPressed: () {
                      // navigate to editor page
                      // update button
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditorPage([
                          _newData.bookName,
                          _newData.authorName,
                          _newData.currentPage,
                          _newData.totalPage,
                        ], this._index);
                      }));
                    },
                    color: Color(0xFF3450F6),
                    elevation: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
