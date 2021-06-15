import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameData extends ChangeNotifier {
  String personName = 'Null';

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    String _pn = prefs.getString('nameSaver');
    personName = _pn;
    notifyListeners();
  }

  Future<void> _setName(String _nameData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nameSaver', _nameData);
  }

  void setData(String _nameData) async {
    personName = _nameData;
    notifyListeners();
    await _setName(_nameData);
  }
}
