import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mydata.dart';
import '../modedata.dart';
import '../model/datatype.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FunctionButton extends StatelessWidget {
  DataType _newData;
  int _index;
  var _constraint;
  FunctionButton(this._newData, this._constraint, this._index);

  // Toast
  void _showMessage(String _message) {
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
    Function _remove = Provider.of<MyData>(context).removeElement;
    bool _mode = Provider.of<ModeData>(context).mode;

    return Container(
      width: _constraint.maxWidth * 0.1,
      child: FittedBox(
        child: GestureDetector(
          child: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            // delete functionality
            showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text(
                      "Delete ?",
                      style: TextStyle(fontFamily: 'Koho-Bold'),
                    ),
                    content: Text(
                      "Are you sure you want to Remove that Book ?",
                      style: TextStyle(fontFamily: 'Koho-Bold'),
                    ),
                    actions: <Widget>[
                      CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontFamily: 'Koho-Bold'),
                          )),
                      CupertinoDialogAction(
                          textStyle: TextStyle(color: Colors.red),
                          isDefaultAction: true,
                          onPressed: () {
                            _remove(this._index);
                            Navigator.pop(context);
                            //_showMessage("Item Removed !!");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Item Removed !',
                                style: TextStyle(
                                    color:
                                        (_mode) ? Colors.black : Colors.white),
                              ),
                              duration: Duration(seconds: 7),
                              backgroundColor:
                                  (_mode) ? Colors.white : Colors.black,
                              action: SnackBarAction(
                                label: "OK",
                                onPressed: () {},
                              ),
                            ));
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(fontFamily: 'Koho-Bold'),
                          )),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
