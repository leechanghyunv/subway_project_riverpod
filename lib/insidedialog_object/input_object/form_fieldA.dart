import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subway_project_230704/setting/export.dart';
import '../display_object/design_dialogA.dart';
import 'input_name.dart';

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
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;
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
                    height: 2.42.w,
                  ),
                  InputSubway(
                      onSelected: widget.onSelected
                  ),
                  SizedBox(
                    height: 3.62.w,
                  ),
                  InputName(
                    onSubmitted: widget.onSubmitted,
                  ),
                  SizedBox(
                    height: 3.62.w,
                  ),
                  DialogDesignBoxA(),
                  SizedBox(
                    height: 3.62.w,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}