import 'package:flutter/material.dart';
import './UI/custom_ui4.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './namedata.dart';
import 'package:provider/provider.dart';
import './homepage.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _nameController = new TextEditingController();

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

  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    Function _setData = Provider.of<NameData>(context).setData;
    return Scaffold(
      body: Stack(
        children: [
          //background ui
          CustomTile4(),

          Scaffold(
            backgroundColor: Colors.transparent,
          ),

          //Name Field
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: _info.size.height * 0.15,
                ),
                //Text
                Container(
                  padding: EdgeInsets.only(
                    left: _info.size.width * 0.07,
                  ),
                  child: Text(
                    "Enter Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _info.size.width * 0.1,
                      fontFamily: 'Koho-Bold',
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: _info.size.height * 0.25,
                ),

                // Text Form Field
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: _info.size.width * 0.055,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Koho-Bold',
                      fontSize: _info.size.width * 0.1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
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
                        fontSize: _info.size.width * 0.1,
                      ),
                    ),
                    maxLength: 20,
                    maxLengthEnforced: true,
                    controller: _nameController,
                  ),
                ),

                SizedBox(
                  height: _info.size.height * 0.15,
                ),
                // Go Button
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
                        "Lets GO",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: _info.size.width * 0.058,
                            fontFamily: 'Koho-Bold'),
                      ),
                    ),
                    onPressed: () {
                      String _nd = _nameController.text;
                      _nd = _nd.trim();
                      if (_nd == '' || _nd == ' ') {
                        _checkAndShow("Wrong Input !!");
                      } else {
                        _setData(_nd);
                        _checkAndShow("Welcome !");
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      }
                    },
                    color: Colors.white,
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
