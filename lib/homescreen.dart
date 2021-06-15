import 'package:flutter/material.dart';
import './UI/tile.dart';
import './editor.dart';
import 'package:provider/provider.dart';
import './mydata.dart';
import './UI/circle_profile.dart';
import './drawer_page.dart';
import './modedata.dart';
import './addname.dart';
import './namedata.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    bool _darkmode = Provider.of<ModeData>(context).mode;
    MediaQueryData _info = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: (_darkmode) ? Colors.black54 : Colors.white,
      key: _scaffoldKey,

      drawer: Drawer(
        child: DrawerPage(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[Container()],
            expandedHeight: _info.size.height * 0.25,
            floating: true,
            title: Text(
              "BookMark",
              style: TextStyle(
                fontFamily: 'Lobstar',
                fontSize: _info.size.width * 0.088,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: FutureBuilder(
                future: Provider.of<NameData>(context, listen: false).getData(),
                builder: (context, snap) =>
                    snap.connectionState == ConnectionState.waiting
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            child: CircleProfile(),
                            onTap: () {
                              // Show Dialog Box Functionality
                              popUpField(context);
                            }),
              ),
            ),
            centerTitle: true,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            )),
          ),

          //Padding
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: _info.size.height * 0.05,
            ),
          ),

          // Tiles
          FutureBuilder(
            future:
                Provider.of<MyData>(context, listen: false).fetchAndSetData(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Consumer<MyData>(
                    child: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Why Ignore Reading Books !',
                          style: TextStyle(
                              color: (_darkmode) ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    // Name of the list is "bookdata"
                    builder: (ctx, bookdata, ch) => bookdata.items.length <= 0
                        ? ch
                        : // build the child items
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return CardTile(bookdata.items[index], index);
                              },
                              childCount: bookdata.items.length,
                            ),
                          ),
                  ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: _info.size.height * 0.055,
            ),
          ),
        ],
      ),

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                // Menu Button
                _scaffoldKey.currentState.openDrawer();
              },
            ),
          ],
        ),
      ),

      //floating action button bottom
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add"),
        icon: Icon(Icons.create_outlined),
        onPressed: () {
          // add button
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditorPage(['', '', '', ''], 5);
          }));
        }, // compose button
        backgroundColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
