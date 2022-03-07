import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:widget_testing_demo/UI/home_page.dart';
import 'package:widget_testing_demo/UI/signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ProSheredPreference _proSheredPreference = ProSheredPreference();

  @override
  Widget build(BuildContext context) {
    print("Log In");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputField(hintText: "Email", controller: emailController),
          inputField(hintText: "Password", controller: passwordController),
          ElevatedButton(
            key: const Key("loginButton"),
            onPressed: onLogin,
            child: const Text("Log In"),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SignUpPage(),
                ),
              );
            },
            child: const Text("Sign Up Page"),
          ),
        ],
      ),
    );
  }

  Future<void> onLogin() async {
    Map<String, String> data;
    try {
      data = await _proSheredPreference.getMultiString(["email", "password"]);
      print(data);
      if (emailController.text == data["email"] &&
          passwordController.text == data["password"]) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      }
    } on PrefException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Padding inputField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        key: Key("login"+hintText),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
