// Flutter imports:
import 'package:flutter/material.dart';

Widget ColorContainer(String line) => Container(
  color: switch(line){
    'Line1' => Color(0xff2a4193), 'Line2' => Color(0xff027a31),
    'Line3' => Color(0xffd75e02), 'Line4' => Color(0xff028bb9),
    'Line5' => Color(0xff9637b6), 'Line6' => Color(0xff885408),
    'Line7' => Color(0xff525d02), 'Line8' => Color(0xfff62d37),
    'Line9' => Color(0xff916a2a), '서해' => Color(0xff8FC31F),
    '공항철도' => Color(0xff0090D2), '경의선' => Color(0xff77C4A3),
    '경춘선' => Color(0xff0C8E72), '수인분당' => Color(0xFFE7E727),
    '신분당' => Color(0xffD4003B), '경강선' => Color(0xff003DA5),
    '인천1선' => Color(0xff7CA8D5), '인천2선' => Color(0xffED8B00),
    '에버라인' => Color(0xff6FB245), '의정부' => Color(0xffFDA600),
    '우이신설' => Color(0xffB7C452), '김포골드' => Color(0xffA17800),
    '신림' => Color(0xff6789CA),
    _ => Colors.black
  },
);

