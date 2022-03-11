import 'package:flutter/material.dart';

class StyKuTextField extends StatelessWidget {
  final String label;
  const StyKuTextField({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const TextField(
            style: TextStyle(color: Colors.black,fontSize: 18.0),
            decoration: InputDecoration(),
            cursorColor: Color(0xffFF0000),
          ),
        ),
      ],
    );
  }
}
