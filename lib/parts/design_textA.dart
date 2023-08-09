import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../setting/initival_value.dart';

class TextContainerA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double mainBoxHeight = appHeight * 0.58;

    return Container(
      color: Colors.transparent,
      width: appHeight * 0.224,
      height: appHeight * 0.067,
      child: Center(
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NUMBER', style: TextStyle(
                  color: Colors.black,
                  fontSize: mainBoxHeight / 25,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: mainBoxHeight / 60,
              ),
              Text('3728C99', style: TextStyle(
                  color: Colors.black,
                  fontSize: mainBoxHeight / 25,
                  fontWeight: FontWeight.bold
              ),
              ), // DWAIX11 // // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
            ],
          ),
          SizedBox(width: mainBoxHeight / 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Tooltip(
                message: '지하철에서 내리는 방향\n급행열차(반대방향)',
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                child: Text(
                  'GATE',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: mainBoxHeight / 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: mainBoxHeight / 60,),

              Tooltip(
                message: '지하철에서 내리는 방향\n급행열차(반대방향)',
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                showDuration: Duration(seconds: 3),
                child: Consumer(builder: (context,ref,widget){
                  final gateText = ref.watch(headingProvider);
                  return RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            gateText == 'RIGHT' ? 'RIGH'
                                : gateText == 'LEFT' ? 'L' : '01',

                            style: TextStyle(
                                color: Colors.black,
                                fontSize: mainBoxHeight / 25,
                                fontWeight: FontWeight.bold),
                          ),

                          TextSpan(
                            text:
                            gateText == 'RIGHT' ? 'T'
                            : gateText == 'LEFT' ? 'EFT' :
                            '00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: mainBoxHeight / 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ));
                }),
              ),

            ],
          ),
        ]),
      ),
    );
  }
}