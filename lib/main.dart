import 'package:flutter/material.dart';
import 'package:user_account_ui/pages/UserPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserPage(),
    );
  }
}
// static storeName(String name) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString("name", name);
// }
//
// static Future<String?>loadName(String name) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString("name");
// }
// static Future<bool>removeName(String name) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.remove("name");
// }
