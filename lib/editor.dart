import 'package:bookmarkapp/mydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import './UI/custom_ui.dart';
import './UI/custom_ui5.dart';
import 'package:provider/provider.dart';
import './mydata.dart';
import './editorfield/editorfield.dart';
import './modedata.dart';

class EditorPage extends StatelessWidget {
  //TextEditingController
  TextEditingController book = new TextEditingController();
  TextEditingController author = new TextEditingController();
  TextEditingController current = new TextEditingController();
  TextEditingController total = new TextEditingController();

  List _newList = [];
  int _index;
  int _fnmode; // 1 for insertion, 2 for updation

  void _checkAndShow(String _message) {
    Fluttertoast.showToast(
        msg: _message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  EditorPage(this._newList, this._index) {
    if (_newList[0] == '' ||
        _newList[1] == '' ||
        _newList[2] == '' ||
        _newList[3] == '') {
      _fnmode = 1;
    } else {
      book.value = TextEditingValue(text: _newList[0]);
      author.value = TextEditingValue(text: _newList[1]);
      current.value = TextEditingValue(text: _newList[2]);
      total.value = TextEditingValue(text: _newList[3]);
      _fnmode = 2;
    }
  }

  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    Function _add = Provider.of<MyData>(context).addElement;
    Function _update = Provider.of<MyData>(context).updateElement;
    bool _darkmode = Provider.of<ModeData>(context).mode;

    return Scaffold(
        body: Stack(children: [
      // BackGround Widget
      CustomTile5(),
      CustomTile(),
      Scaffold(
        backgroundColor: Colors.transparent,
      ),

      //Entire Screen
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

          // Editor Card
          Container(
            padding: EdgeInsets.only(
              top: _info.size.height * 0.02,
              left: _info.size.width * 0.04,
              right: _info.size.width * 0.04,
            ),
            height: _info.size.height * (1 - 0.34),
            width: _info.size.width,
            child: Card(
              child: EditorField(book, author, current, total),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              shadowColor: Color(0xFFE6ECF8),
              color: Colors.white70,
            ),
          ),

          SizedBox(
            height: _info.size.height * 0.07,
          ),

          // Save Button
          Container(
            padding: EdgeInsets.only(
              left: _info.size.width * 0.07,
              right: _info.size.width * 0.07,
            ),
            width: _info.size.width,
            height: _info.size.height * 0.07,
            child: RaisedButton(
              child: Text(
                "SAVE",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _info.size.width * 0.05,
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Koho-Bold'),
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                // Save Button Function
                String bookName = book.text;
                String authorName = author.text;
                String currentPage = current.text;
                String totalPage = total.text;

                bookName = bookName.trim();
                authorName = authorName.trim();
                currentPage = currentPage.trim();
                totalPage = totalPage.trim();

                if (bookName == '' ||
                    authorName == '' ||
                    currentPage == '' ||
                    totalPage == '') {
                  _checkAndShow("Incomplete Input !!");
                } else if (int.parse(currentPage) > int.parse(totalPage) ||
                    int.parse(currentPage) <= 0 ||
                    int.parse(totalPage) <= 0) {
                  _checkAndShow("Wrong Input !!");
                } else {
                  if (_fnmode == 1) {
                    _add([
                      bookName,
                      authorName,
                      currentPage,
                      totalPage,
                    ]);

                    //toast
                    _checkAndShow("Saved !!");
                    //Navigator.pop(context);
                  } else {
                    _update([
                      bookName,
                      authorName,
                      currentPage,
                      totalPage,
                    ], this._index);

                    //toast
                    _checkAndShow("Updated !!");
                    //Navigator.popUntil(context, ModalRoute.withName('/'));
                  }

                  //going back
                  //Navigator.popUntil(context, ModalRoute.withName('/'));
                  Navigator.pop(context);
                }
              },
            ),
          ),

          SizedBox(
            height: _info.size.height * 0.04,
          ),
        ]),
      ),
    ]));
  }
}
