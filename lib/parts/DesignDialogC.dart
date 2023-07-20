import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorContainer.dart';

class DialogDesignBoxC extends StatelessWidget {

  final String stringNumber;
  final String subwayName;

  DialogDesignBoxC({Key? key, required this.stringNumber, required this.subwayName}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    return Container(
      height: appHeight * 0.0672,/// appHeight * 0.0672
      decoration: BoxDecoration(
        // color: b1
      ),
      child: Row(
        children: [
          SizedBox(
            height: appHeight * 0.0672,
            width: appHeight * 0.0168,
            child: ColorContainer(
                stringNumber: stringNumber),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.0560,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('LineN',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text(
                  '${stringNumber}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: appHeight * 0.0168),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.0784,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('${subwayName}역',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('SMS Call',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
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
                        fontSize: appHeight * 0.0168),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
