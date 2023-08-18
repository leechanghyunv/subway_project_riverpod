import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {

  final String stringNumber;

  const ColorContainer({
    required this.stringNumber,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: stringNumber == 'Line1'? const Color(0xff2a4193)
           : stringNumber == 'Line2'?  const Color(0xff027a31)
           : stringNumber == 'Line3'?  const Color(0xffd75e02)
           : stringNumber == 'Line4'?  const Color(0xff028bb9)
           : stringNumber == 'Line5'?  const Color(0xff9637b6)
           : stringNumber == 'Line6'?  const Color(0xff885408)
           : stringNumber == 'Line7'?  const Color(0xff525d02)
           : stringNumber == 'Line8'?  const Color(0xfff62d37)
           : stringNumber == 'Line9'?  const Color(0xff916a2a)
           : stringNumber == '서해'?    const Color(0xff8FC31F)
           : stringNumber == '공항철도'? const Color(0xff0090D2)
           : stringNumber == '경의선'? const Color(0xff77C4A3)
           : stringNumber == '경춘선'?   const Color(0xff0C8E72)
           : stringNumber == '수인분당'? const Color(0xFFE7E727)
           : stringNumber == '신분당'?   const Color(0xffD4003B)
           : stringNumber == '경강선'?   const Color(0xff003DA5)
           : stringNumber == '인천1선'?  const Color(0xff7CA8D5)
           : stringNumber == '인천2선'?  const Color(0xffED8B00)
           : stringNumber == '에버라인'?  const Color(0xff6FB245)
           : stringNumber == '의정부'?   const Color(0xffFDA600)
           : stringNumber == '우이신설'? const Color(0xffB7C452)
           : stringNumber == '김포골드'? const Color(0xffA17800)
           : stringNumber == '신림'?   const Color(0xff6789CA)
           : Colors.black,
    );
  }
}