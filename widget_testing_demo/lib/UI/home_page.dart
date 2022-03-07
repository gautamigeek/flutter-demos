import 'package:flutter/material.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:widget_testing_demo/UI/login_page.dart';
import 'package:widget_testing_demo/UI/signup_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProSheredPreference _proSheredPreference = ProSheredPreference();
  String mail = "";
  String password = "";

  @override
  void initState() {
    getData();
    print("gautam");
    super.initState();
  }

  Future<void> getData() async {
    Map<String, String> data =
        await _proSheredPreference.getMultiString(["email", "password"]);
    setState(() {
      mail = data["email"] ?? "";
      password = data["password"] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Teating"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mail),
          Text(password),
          ElevatedButton(
            key: const Key("logoutButton"),
            onPressed: onLogOut,
            child: const Text("Log out"),
          ),
        ],
      ),
    );
  }

  onLogOut() {
    print("log out");
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<dynamic>(
        builder: (screen) => LoginPage(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
