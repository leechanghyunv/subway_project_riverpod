import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFrame extends StatelessWidget {

  final String comment;
  final TextOverflow? overflow;
  final Color? color;

  const TextFrame({
    super.key,
    required this.comment,
    this.overflow,
    this.color, });

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    final nameWithoutParentheses = comment.replaceAll(RegExp(r'\([^()]*\)'), '');
    if(comment.contains('급행')){ /// 급행일때는 깜빡이고 도착일때는 색깔이 바뀌는 에니매이션을 고려중이다.
      return BlinkText(
        nameWithoutParentheses,
        style: TextStyle(
          fontSize: appHeight * 0.0168,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        beginColor: Colors.black,
        duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
        times: 2, /// 깜빡이는 횟수라고 한다.
      );
    } else if(comment.contains('진입')){
      return BlinkText(
        nameWithoutParentheses,
        style: TextStyle(
          fontSize: appHeight * 0.0168,
          fontWeight: FontWeight.bold,
        ),
        beginColor: Colors.black,
        duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
        times: 2, /// 깜빡이는 횟수라고 한다.
      );
    } else
      return Text(
        nameWithoutParentheses,
        style: TextStyle(
          fontSize: appHeight * 0.0168,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      );
  }
}