import 'package:responsive_sizer/responsive_sizer.dart';
import '../setting/export.dart';

Widget LoadingBox(String text) => Container(
  color: Colors.grey[200],
  height: 40.w,
  alignment: Alignment.center,
  child:  TextFrame(comment: text),
);