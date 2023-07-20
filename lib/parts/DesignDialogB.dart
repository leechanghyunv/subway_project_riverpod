

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screen/LayoutScreen.dart';
import '../screen/MainScreen.dart';
import 'ColorContainer.dart';

class DialogDesignBoxB extends StatelessWidget {


  const DialogDesignBoxB({super.key});

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    return Container(
      height: appHeight * 0.0672,
      // color: b1,
      child: Row(
        children: [
          SizedBox(
            height: appHeight * 0.0672,
            width: appHeight * 0.0168,
            child: ColorContainer(
                stringNumber: box.read('lineT') ?? 'Line2'),
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
                Text('Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text(
                    DateFormat('MM-dd').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
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
                Text('Transfer',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text(
                    box.read('subwayT') != null
                        ? '${box.read('subwayT')}역'
                        : '',
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
            width: appHeight * 0.1008,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('Passenger',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text(box.read('name') ?? '',
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