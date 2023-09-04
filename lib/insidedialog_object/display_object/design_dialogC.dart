import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subway_project_230704/setting/export.dart';

class DialogDesignBoxC extends StatelessWidget {

  final String stringNumber;
  final String subwayName;
  DialogDesignBoxC({Key? key, required this.stringNumber, required this.subwayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtered = subwayName.replaceAll(RegExp(r'\([^()]*\)'), '');

    double sizeWidth = 2.42.w;
    double sizeWidth2 = 1.8.w;
    double textSize = 3.6.w;
    double contHeight = 17.w;

    return Container(
      height: 14.5.w,
      child: Row(
        children: [
          SizedBox(
            height: 14.5.w,
            width: 3.6.w,
            child: ColorContainer(
                stringNumber: stringNumber),
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
                Text('LineN',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                  '${stringNumber}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize),
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
                Text('Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text('${filtered}역',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
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
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text( stringNumber == 'Line1' ? '1577-1234'
                    : stringNumber == 'Line2' ? '1577-1234'
                    : stringNumber == 'Line3' ? '1577-1234'
                    : stringNumber == 'Line4' ? '1577-1234'
                    : stringNumber == 'Line5' ? '1577-1234'
                    : stringNumber == 'Line6' ? '1577-1234'
                    : stringNumber == 'Line7' ? '1577-1234'
                    : stringNumber == 'Line8' ? '1577-1234'
                    : stringNumber == 'Line9' ? '1577-4009'
                    : stringNumber == '신분당' ? '(031)8018-7777'
                    : '1544-7769',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
