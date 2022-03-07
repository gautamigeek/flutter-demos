import 'package:flutter/material.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:widget_testing_demo/UI/home_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ProSheredPreference _proSheredPreference = ProSheredPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputField(hintText: "Email", controller: emailController),
          inputField(hintText: "Password", controller: passwordController),
          ElevatedButton(
            key: const Key("signupButton"),
            onPressed: onsignup,
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }

  Future<void> onsignup() async {
    print(emailController.text);
    print(passwordController.text);
    if (emailController.text != "" && passwordController.text != "") {
      bool isSet = await _proSheredPreference.setMultiString({
        "email": emailController.text,
        "password": passwordController.text,
      });
      print("a");
      print(isSet);
      if (isSet) {
      print("b");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomePage(),
          ),
        );
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
        key: Key("signup"+hintText),
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
