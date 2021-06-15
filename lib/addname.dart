import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './namedata.dart';
import './modedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

final TextEditingController _nameDx = TextEditingController();

void popUpField(BuildContext context) {
  MediaQueryData _info = MediaQuery.of(context);
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            height: _info.size.height * 0.5,
            width: _info.size.width,
            padding: EdgeInsets.only(
              bottom: _info.viewInsets.bottom,
            ),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                bottom: _info.size.height * 0.04,
                left: _info.size.width * 0.028,
                right: _info.size.width * 0.028,
              ),
              child: AddName(),
            ),
          ),
        );
      });
}

class AddName extends StatelessWidget {
  // Toast
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

  // build
  Widget build(BuildContext context) {
    bool _darkmode = Provider.of<ModeData>(context).mode;
    Function _update = Provider.of<NameData>(context).setData;
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          height: constraint.maxHeight,
          width: constraint.maxWidth,

          decoration: BoxDecoration(
            color: (_darkmode) ? Color(0xFF323741) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),

          // Widget elements
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TextField
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.05),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black, //Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Koho-Bold',
                    fontSize: constraint.maxWidth * 0.1,
                  ),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(
                      color: (_darkmode) ? Colors.white : Colors.black,
                    ),
                    filled: true,
                    fillColor: Colors.white54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    hintText: "Nickname",
                    hintMaxLines: 1,
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Koho-Bold',
                      fontSize: constraint.maxWidth * 0.1,
                    ),
                  ),
                  maxLength: 20,
                  maxLengthEnforced: true,
                  controller: _nameDx,
                ),
              ),

              // Update Button
              Container(
                child: CupertinoButton(
                  color: (_darkmode) ? Color(0xFFEE719B) : Color(0xFF1F5EFF),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: constraint.maxWidth * 0.07,
                      fontFamily: 'Koho-Bold',
                      color: (_darkmode) ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // Update Functionality
                    String _fn = _nameDx.text;
                    _fn = _fn.trim();
                    if (_fn == '') {
                      _checkAndShow("Wrong Input !!");
                    } else {
                      _update(_fn);
                      _nameDx.value = TextEditingValue.empty;
                      _checkAndShow("Updated !!");
                      //Navigator.popUntil(context, ModalRoute.withName('/'));
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
