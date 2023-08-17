import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_container.dart';

class DialogDesignBoxC extends StatelessWidget {

  final String stringNumber;
  final String subwayName;

  DialogDesignBoxC({Key? key, required this.stringNumber, required this.subwayName}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;

    double sizeWidth = appWidth * 0.0242;
    double sizeWidth2 = appWidth * 0.018;
    double textSize = appWidth * 0.0362;

    double contHeight = appWidth * 0.1686;
    double contWidth = appWidth * 0.0242;


    return Container(
      height: appWidth * 0.1449,  /// 60
      child: Row(
        children: [
          SizedBox(
            height: appWidth * 0.1449,
            width: appWidth * 0.0362,
            child: ColorContainer(
                stringNumber: stringNumber),
          ),
          SizedBox(
            width: sizeWidth2,
          ),
          Container(
            height: contHeight,
            width: appWidth * 0.12,
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
            width: sizeWidth2,
          ),
          Container(
            height: contHeight,
            width: appWidth * 0.16,
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
                Text('${subwayName}역',
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
            width: appHeight * 0.12,
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
