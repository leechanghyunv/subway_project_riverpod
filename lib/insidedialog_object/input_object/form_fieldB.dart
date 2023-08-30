import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subway_project_230704/setting/export.dart';
import '../display_object/design_dialogB.dart';
import 'input_name.dart';

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
  Widget build(BuildContext context) {

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
                    height: 2.42.w,
                  ),
                  InputSubway(onSelected: widget.onSelectedA),
                  SizedBox(
                    height: 3.62.w,
                  ),
                  InputSubway(onSelected: widget.onSelectedB),
                  SizedBox(
                    height: 3.62.w,
                  ),
                  InputName(
                    onSubmitted: widget.onSubmitted,
                  ),
                  SizedBox(
                    height: 3.5.w,
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