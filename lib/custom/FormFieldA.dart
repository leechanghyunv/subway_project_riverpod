import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../parts/DesignDialogA.dart';
import '../parts/QrContainer.dart';
import '../screen/LayoutScreen.dart';
import '../screen/MainScreen.dart';
import 'InputName.dart';
import 'InputSubway.dart';

class TextFormA extends StatefulWidget {
  final void Function(String)? onSelected;
  final Function(String) onSubmitted;


  const TextFormA(
      {Key? key,
        required this.onSelected,
        required this.onSubmitted,
       })
      : super(key: key);

  @override
  State<TextFormA> createState() => _TextFormAState();
}

class _TextFormAState extends State<TextFormA> {

  @override
  void initState() {
    super.initState();
    firstguide();
  }


  void firstguide(){
    bool SaveA = box.read('SaveA') ?? true;
    if (SaveA){
      box.write('SaveA', false);
      Get.snackbar(
        'Save 버튼 사용법',
        '\nSave를 짧게 누르면 목적지(출발지점)A 저장\nSave를 길게 누르면 목적지(도착지점)B 저장',
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
        shouldIconPulse: true,
      );
    }else {

    }
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    return Form(
        child: Column(
          children: [
            DialogDesign(
              designText: 'Boarding Psss',
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: appHeight * 0.0112,
                  ),
                  InputSubway(
                      onSelected: widget.onSelected),
                  SizedBox(
                    height: appHeight * 0.0168,
                  ),
                  InputName(
                    onSubmitted: widget.onSubmitted,
                  ),
                  SizedBox(
                    height: appHeight * 0.0168,
                  ),
                  DialogDesignBoxA(),
                  SizedBox(
                    height: appHeight * 0.0168,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}