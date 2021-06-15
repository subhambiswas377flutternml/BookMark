import 'package:flutter/foundation.dart';
import './model/datatype.dart';
import './helper/database_helper.dart';
import 'package:uuid/uuid.dart';

class MyData extends ChangeNotifier {
  final dbHelper = DBHelper.instance;
  List<DataType> myList = [];

  List<DataType> get items {
    return [...myList];
  }

  // id
  // book
  // author
  // current
  // total

  // Shared Pref Keys List
  // mode : 'modeSaver' , modeVal
  // userName : 'nameSaver' nameVal
  // maxNum : 'maxNumSaver' maxVal

  String userName;

  // Index     Item

  //   0      bookName
  //   1      authorName
  //   2      currentPage
  //   4      totalPage

  //Add function
  void addElement(List _newlist) {
    var _uidgent = Uuid();
    String _uniqkey = _uidgent.v1().toString();

    final _newData = DataType(
      id: _uniqkey,
      bookName: _newlist[0],
      authorName: _newlist[1],
      currentPage: _newlist[2],
      totalPage: _newlist[3],
    );

    myList.add(_newData);
    notifyListeners();

    dbHelper.insert('bookdata', {
      'id': _newData.id,
      'book': _newData.bookName,
      'author': _newData.authorName,
      'current': _newData.currentPage,
      'total': _newData.totalPage,
    });
  }

  Future<void> fetchAndSetData() async {
    final dataList = await dbHelper.getData('bookdata');

    myList = dataList
        .map(
          (item) => DataType(
            id: item['id'],
            bookName: item['book'],
            authorName: item['author'],
            currentPage: item['current'],
            totalPage: item['total'],
          ),
        )
        .toList();
    notifyListeners();
  }

  // Remove Function
  void removeElement(int _index) {
    String _idx = myList[_index].id;
    myList.removeAt(_index);
    notifyListeners(); // to change all the listeners
    dbHelper.delete(_idx);
  }

  void updateElement(List _newlist, int _index) {
    String _idx = myList[_index].id;
    final _newData = DataType(
      id: _idx,
      bookName: _newlist[0],
      authorName: _newlist[1],
      currentPage: _newlist[2],
      totalPage: _newlist[3],
    );

    myList[_index] = _newData;
    notifyListeners();

    dbHelper.update({
      'id': _newData.id,
      'book': _newData.bookName,
      'author': _newData.authorName,
      'current': _newData.currentPage,
      'total': _newData.totalPage,
    });
  }
}
