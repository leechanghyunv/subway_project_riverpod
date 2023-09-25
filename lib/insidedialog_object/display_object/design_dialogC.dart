import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subway_project_230704/setting/export.dart';

class DialogDesignBoxC extends StatelessWidget {

  final String line;
  final String name;

  DialogDesignBoxC({Key? key, required this.line, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtered = name.replaceAll(RegExp(r'\([^()]*\)'), '');

    double sizeWidth = 2.42.w;
    double sizeWidth2 = 1.8.w;
    double contHeight = 17.w;

    return Container(
      height: 14.5.w,
      child: Row(
        children: [
          SizedBox(
            height: 14.5.w,
            width: 3.6.w,
            child: ColorContainer(line),
          ),
          SizedBox(
            width: 1.8.w,
          ),
          Container(
            height: contHeight,
            width: 13.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('LineN', style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                  line, style: dialogABC,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Container(
            height: contHeight,
            width: 16.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Location', style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),
                Text('$filtered역',
                    style: dialogABC,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(
            width: sizeWidth2,
          ),
          Container(
            height: contHeight,
            width: 12.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('SMS Call',
                  style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),
                Text( line == 'Line1' ? '1577-1234'
                    : line == 'Line2' ? '1577-1234'
                    : line == 'Line3' ? '1577-1234'
                    : line == 'Line4' ? '1577-1234'
                    : line == 'Line5' ? '1577-1234'
                    : line == 'Line6' ? '1577-1234'
                    : line == 'Line7' ? '1577-1234'
                    : line == 'Line8' ? '1577-1234'
                    : line == 'Line9' ? '1577-4009'
                    : line == '신분당' ? '(031)8018-7777'
                    : '1544-7769',
                    style: dialogABC,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
