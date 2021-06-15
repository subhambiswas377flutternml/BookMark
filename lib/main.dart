import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './homepage.dart';
import './mydata.dart';
import './modedata.dart';
import './namedata.dart';
import './login.dart';

String _person; // global varibale
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefname = await SharedPreferences.getInstance();
  _person = prefname.getString('nameSaver');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      // providers
      providers: [
        // Provider 1
        ChangeNotifierProvider<MyData>(
          create: (context) {
            return MyData();
          },
        ),

        //Provider 2
        ChangeNotifierProvider<ModeData>(create: (context) {
          return ModeData();
        }),

        //Provider 3
        ChangeNotifierProvider<NameData>(create: (context) {
          return NameData();
        })
      ],

      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF001A8F), //Color(0xFF6C60E0),
          accentColor: Colors.deepOrange,
        ),
        home: (_person == null) ? LoginScreen() : HomePage(),
      ),
    );
  }
}
