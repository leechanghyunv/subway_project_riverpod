import 'package:flutter/cupertino.dart';
import '../parts/design_dialogB.dart';
import '../parts/qr_container.dart';
import 'input_name.dart';
import 'input_subway.dart';

class TextFormB extends StatefulWidget {
  final void Function(String)? onSelectedA;
  final void Function(String)? onSelectedB;
  final Function(String) onSubmitted;

  const TextFormB(
      {Key? key,
        required this.onSelectedA,
        required this.onSelectedB,
        required this.onSubmitted,
        })
      : super(key: key);

  @override
  State<TextFormB> createState() => _TextFormBState();
}

class _TextFormBState extends State<TextFormB> {


  @override
  void initState() {
    super.initState();
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
                children: [
                  SizedBox(
                    height: appHeight * 0.0112,
                  ),
                  InputSubway(onSelected: widget.onSelectedA),
                  SizedBox(
                    height: appHeight * 0.0168,
                  ),
                  InputSubway(onSelected: widget.onSelectedB),
                  SizedBox(
                    height: appHeight * 0.0168,
                  ),
                  InputName(
                    onSubmitted: widget.onSubmitted,
                  ),
                  SizedBox(
                    height: appHeight * 0.015,
                  ),
                  DialogDesignBoxB(

                  ),
                ],
              ),
            ),
          ],
        ));
  }
}