import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeData extends ChangeNotifier {
  bool mode = false;

  // <Dark Mode Function>
  Future<bool> _getMode() async {
    final prefs = await SharedPreferences.getInstance();
    final modeVal = prefs.getInt('modeSaver');
    if (modeVal == null) {
      return false;
    } else if (modeVal == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _setMode() async {
    final prefs = await SharedPreferences.getInstance();
    final modeVal = prefs.getInt('modeSaver');
    if (modeVal == 1) {
      prefs.setInt('modeSaver', 0);
    } else {
      prefs.setInt('modeSaver', 1);
    }
  }
  // </Dark Mode>

  // Initialize Function
  void _fetchMode() async {
    mode = await _getMode();
    notifyListeners();
  }

  Future<void> fetchAndSetMode() async {
    _fetchMode();
  }

  // Enable/Disable Dark Mode Function
  void darkMode(bool _value) {
    mode = _value;
    _setMode();
    notifyListeners();
  }
}
