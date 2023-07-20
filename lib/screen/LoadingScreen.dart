import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subway_project_230704/screen/LayoutScreen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    return LayoutScreen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlinkText(
              '안녕',
              style: TextStyle(
                fontSize: appHeight * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다
            ),
          ],
        ),
      ),
    );
  }
}