import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:academytime/models/user.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  String? _programSelection = 'Flutter';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_programSelection != null) {
      final userBox = Hive.box<User>('userBox');
      final user = User(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        program: _programSelection!,
      );
      await userBox.add(user);
      Navigator.pushNamed(context, '/desiredPage');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lütfen bir program seçin')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaydol'),
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
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'Ad'),
          ),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Soyad'),
          ),
          DropdownButton<String>(
            value: _programSelection,
            hint: Text('Program Seçimi'),
            items: [
              DropdownMenuItem(
                child: Text('Flutter'),
                value: 'Flutter',
              ),
              DropdownMenuItem(
                child: Text('Unity'),
                value: 'Unity',
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                _programSelection = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: _programSelection == null ? null : _register,
            child: Text('Kaydol'),
          ),
        ],
      ),
    );
  }
}
