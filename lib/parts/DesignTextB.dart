import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:subway_project_230704/setting/InitivalValue.dart';

import '../screen/LayoutScreen.dart';
import '../screen/MainScreen.dart';

class TextContainerB extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    double appHeight = MediaQuery.of(context).size.height;
    double mainBoxHeight = appHeight * 0.58;
    final userName = ref.watch(userNameProvier);

    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 25),
                  ),
                  SizedBox(
                    height: mainBoxHeight / 60,
                  ),
                  Text(
                    DateFormat('MM/dd ').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 25),
                  ),
                ],
              ),

              /// DATE
              SizedBox(
                width: mainBoxHeight / 27.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'CODE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 25),
                  ),
                  SizedBox(
                    height: mainBoxHeight / 60,
                  ),
                  Consumer(builder: (context,ref,child){
                    final code = ref.watch(codeConveyProvider);
                    return Text(code.isNotEmpty
                        ? '${code}'
                        : '0000',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: mainBoxHeight / 25),
                    );
                  }),

                ],
              ),

              /// SEAT
              SizedBox(
                width: mainBoxHeight / 27.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CLASS',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 25),
                  ),
                  SizedBox(
                    height: mainBoxHeight / 60,
                  ),
                  Text(
                    // controllerAPI_D.Type == null? 'NOR(S)'
                    //   : controllerAPI_D.Type == '급행'? 'EXP(S)'
                    //   : controllerAPI_D.Type == 'ITX' ? 'ITX(T)' :
                    'NOR(S)',

                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 25),
                  ),
                ],
              ),

              /// CLASS
            ],
          ),
          SizedBox(
            height: mainBoxHeight / 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PASSENGER :',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: mainBoxHeight / 25),
              ),
              SizedBox(
                height: mainBoxHeight / 40,
              ),
              Text(
                box.read('name') ?? userName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: mainBoxHeight / 30),
              ),
            ],
          ),

          /// PASSENGER NAME
        ],
      ),
    );
  }
}