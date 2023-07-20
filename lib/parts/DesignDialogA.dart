import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:subway_project_230704/model/DataModel.dart';
import 'package:subway_project_230704/setting/InitivalValue.dart';
import '../screen/LayoutScreen.dart';
import '../screen/MainScreen.dart';
import 'ColorContainer.dart';

class DialogDesignBoxA extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    final stringNumber = ref.watch(lineProvier);

    return Container(
      height: appHeight * 0.0672,
      decoration: BoxDecoration(color: Colors.white),
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
                Text('Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),


                Consumer(
                    builder: (__,ref,widget){
                  final subwayName = ref.watch(nameProvier);
                  if(subwayName.isNotEmpty){
                    return Text(
                        subwayName == 'SEOUL'
                            ? 'SEOUL'
                            : '${subwayName}역',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: appHeight * 0.0168),
                        overflow: TextOverflow.ellipsis);
                  }
                  return Text('');
                }),

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