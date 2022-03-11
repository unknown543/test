import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
