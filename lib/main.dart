import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:academytime/pages/home_page.dart';
import 'package:academytime/pages/login_page.dart';
import 'package:academytime/pages/register_page.dart';
import 'package:academytime/models/user.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  // Add this line to delete the existing box
  await Hive.deleteBoxFromDisk('userBox');

  await Hive.openBox<User>('userBox');

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  get user => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        // Remove the route for UserListPage
        '/desiredPage': (context) => RegisterPage(), // Add your desired page route here
      },
    );
  }
}
