import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:academytime/models/user.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final userBox = Hive.box<User>('userBox');
    final email = _emailController.text;
    final password = _passwordController.text;

    final user = userBox.values.cast<User?>().firstWhere(
          (user) => user?.email == email && user?.password == password,
      orElse: () => null,
    );

    if (user != null) {
      Navigator.pushNamed(context, '/desiredPage');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Geçersiz giriş')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Şifre'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('Giriş'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/register'),
            child: Text('Kaydol'),
          ),
        ],
      ),
    );
  }
}

