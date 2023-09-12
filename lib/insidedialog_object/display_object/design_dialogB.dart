import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class DialogDesignBoxB extends StatelessWidget {


  const DialogDesignBoxB({super.key});

  @override
  Widget build(BuildContext context) {
    final String subwayName = box.read('nameT') ?? '';
    final filtered = subwayName.replaceAll(RegExp(r'\([^()]*\)'), '');

    double sizeWidth = 2.42.w;
    double textSize = 3.5.w;
    double contHeight = 16.8.w;

    return Container(
      height: 16.5.w,
      // color: b1,
      child: Row(
        children: [
          SizedBox(
            height: 14.5.w,
            width: 3.6.w,
            child: ColorContainer(box.read('lineT') ?? 'Line2'),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: contHeight,
            width: 12.5.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                    DateFormat('MM-dd').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
              ],
            ),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: 17.w,
            width: 17.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Transfer',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                    box.read('nameT') != null
                        ? '${filtered}역'
                        : '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: 17.w,
            width: 22.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Passenger',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(box.read('name') ?? '',
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