import 'package:flutter/material.dart';

class QuestionBox extends StatefulWidget {
  final String text;
  final Function(String)? onSubmitted;

  const QuestionBox({Key? key, required this.text, this.onSubmitted})
      : super(key: key);

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite * 0.7,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: widget.text,
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}