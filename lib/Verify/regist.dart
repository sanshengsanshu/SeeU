import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistPage extends StatefulWidget {
  RegistPage({Key key}) : super(key: key);

  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _usernameC = TextEditingController();
  final _passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          TextField(
            controller: _usernameC,
            decoration: InputDecoration(labelText: '用户名'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordC,
            decoration: InputDecoration(labelText: '密码'),
          ),
          RaisedButton(
            child: Text('提交'),
            onPressed: () {
              print('名称${_usernameC.text}密码${_passwordC.text}');
              setUserName(_usernameC.text);
              setPassword(_passwordC.text);
              getUserName().then((String username) {
                print('${username}');
              });
              getPassword().then((String password) {
                print('${password}');
              });
            },
          )
        ],
      ),
    );
  }
}

setUserName(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

setPassword(String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('password', password);
}

Future<String> getPassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password');
}
