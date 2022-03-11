import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_test/common_button.dart';
import 'package:notification_test/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF0000),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "S t y k u",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10.0),
              Text(
                "SHAPE FOUR YOUR FUTURE",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 50.0),
              const StyKuTextField(label: "Username"),
              const SizedBox(height: 10.0),
              const StyKuTextField(label: "Password"),
              const SizedBox(height: 10.0),
              const CommonButton(),
            ],
          ),
        ),
      ),
    );
  }
}
