import 'package:flutter/material.dart';

class EditorField extends StatelessWidget {
  TextEditingController _bn;
  TextEditingController _an;
  TextEditingController _cp;
  TextEditingController _tp;
  EditorField(this._bn, this._an, this._cp, this._tp);

  // Widget Function
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Book Name
          Container(
            margin: EdgeInsets.only(
              left: constraint.maxWidth * 0.05,
              right: constraint.maxWidth * 0.05,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                hintText: "Book Name",
              ),
              style: TextStyle(
                fontSize: constraint.maxHeight * 0.045,
              ),
              controller: this._bn, // Editor Text Field
            ),
          ),
          // Author Name
          Container(
            margin: EdgeInsets.only(
              left: constraint.maxWidth * 0.05,
              right: constraint.maxWidth * 0.05,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                hintText: "Author Name",
              ),
              style: TextStyle(
                fontSize: constraint.maxHeight * 0.045,
              ),
              controller: this._an, // Editor Text Field
            ),
          ),

          // Current Page
          Container(
            margin: EdgeInsets.only(
              left: constraint.maxWidth * 0.05,
              right: constraint.maxWidth * 0.05,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                hintText: "Current Page",
              ),
              style: TextStyle(
                fontSize: constraint.maxHeight * 0.045,
              ),
              controller: this._cp,
              keyboardType: TextInputType.number,
              maxLength: 5, // Editor Text Field
            ),
          ),

          // Total Page
          Container(
            margin: EdgeInsets.only(
              left: constraint.maxWidth * 0.05,
              right: constraint.maxWidth * 0.05,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                hintText: "Total Page",
              ),
              style: TextStyle(
                fontSize: constraint.maxHeight * 0.045,
              ),
              controller: this._tp, // Editor Text Field
              keyboardType: TextInputType.number,
              maxLength: 5,
            ),
          ),
        ],
      );
    });
  }
}
