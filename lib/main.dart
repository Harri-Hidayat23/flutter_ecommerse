import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerse/pages/pages.dart';
import 'package:flutter_ecommerse/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: //isviewed != 0 ? OnBoard() : Wrapper(),
            OnBoard());
  }
}
