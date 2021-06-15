import 'package:flutter/foundation.dart';

class DataType {
  final String id;
  final String bookName;
  final String authorName;
  final String currentPage;
  final String totalPage;

  DataType({
    @required this.id,
    @required this.bookName,
    @required this.authorName,
    @required this.currentPage,
    @required this.totalPage,
  });
}
