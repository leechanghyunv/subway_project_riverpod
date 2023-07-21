import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:subway_project_230704/custom/TextFrame.dart';
import 'package:subway_project_230704/screen/LayoutScreen.dart';
import 'package:timer_builder/timer_builder.dart';
import '../model/TableModel.dart';
import '../model/WeatherModel.dart';
import '../setting/InitivalValue.dart';

class TableScreen extends ConsumerWidget {

  ScrollController _scrollControllerA = ScrollController();
  ScrollController _scrollControllerB = ScrollController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;  /// 414.0 IPHONE11

    final tableA = ref.watch(subTableProviderA(ref.watch(codeConveyProvider)));
    final tableB = ref.watch(subTableProviderB(ref.watch(codeConveyProvider)));

    final weather = ref.watch(weatherProvider);
    final temp = ref.watch(tempProvider);
    final svg = ref.watch(svgProvider);

    return LayoutScreen(
      body: Center(
        child: tableA.when(
          error: (err, stack) => Text(err.toString()),
          loading: () => const Center(
              child: TextFrame(comment: 'loading.....')),
          data: (data){
            if(data.isNotEmpty){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      color: Colors.grey[300],
                      width: double.maxFinite,
                      alignment: Alignment.centerLeft,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              svg.when(
                                loading: () => const Center(
                                    child: TextFrame(comment: 'loading.....')),
                                error: (err, stack) => Text(err.toString()),
                                data: (data){
                                  return data;
                                },
                              ),
                              weather.when(
                                loading: () => const Center(
                                    child: TextFrame(comment: 'loading.....')),
                                error: (err, stack) => Text(err.toString()),
                                data: (data){
                                  return  TextFrame(
                                    comment: data.first.description,
                                    overflow: TextOverflow.fade,);
                                },
                              ),
                              SizedBox(width: 5,),
                              temp.when(
                                loading: () => const Center(
                                    child: TextFrame(comment: '')),
                                error: (err, stack) => Text(err.toString()),
                                data: (data){
                                  return TextFrame(comment: '${(data.temp- 273.15).toStringAsFixed(0)}\u2103');
                                },
                              ),
                              Expanded(child: Text('')),
                              TimerBuilder.periodic(
                                const Duration(seconds: 1),
                                builder: (context) {
                                  return Row(
                                    children: [
                                      TextFrame(comment: formatDate(DateTime.now(), [' ',HH, ':', nn, ':', ss, ' '])),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: appWidth * 0.5,
                            height: appHeight * 0.90,
                            alignment: Alignment.center,
                            child: ListView.builder(
                                controller: _scrollControllerA,
                                itemCount: tableA.value!.length,
                                itemBuilder:(context, index){
                                  var row = tableA.value![index];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '${row.sname} > ${row.ename}행 \n',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        overflow: TextOverflow.ellipsis),
                                                  ),
                                                  TextSpan(
                                                    text:'${row.express.name == 'GENERAL'
                                                        ? '${row.express.name}(일반)'
                                                        : '${row.express.name}(급행)'}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: row.express.name == 'GENERAL'
                                                            ? Colors.black
                                                            : Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        overflow: TextOverflow.ellipsis),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      '${row.arrivetime}'.substring(0,5),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: appWidth * 0.5,
                            height: appHeight * 0.90,
                            alignment: Alignment.center,
                            child: ListView.builder(
                                controller: _scrollControllerB,
                                itemCount: tableB.value!.length,
                                itemBuilder:(context, index){
                                  var row = tableB.value![index];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '${row.sname} > ${row.ename}행 \n',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        overflow: TextOverflow.ellipsis),
                                                  ),
                                                  TextSpan(
                                                    text:'${row.express.name == 'GENERAL'
                                                        ? '${row.express.name}(일반)'
                                                        : '${row.express.name}(급행)'}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: row.express.name == 'GENERAL'
                                                            ? Colors.black
                                                            : Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        overflow: TextOverflow.ellipsis),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      '${row.arrivetime}'.substring(0,5),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),



                ],
              );
            } else if(data.isEmpty){
              return Center(
                  child: Column(
                    children: [
                      TextFrame(comment: ''),
                    ],
                  ),
                );
            }
          },
        )



      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(Alignment.bottomRight.x, Alignment.bottomRight.y - 0.2),
            child: FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              elevation: 0.1,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_return,
                color: Colors.white,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              elevation: 0.1,
              onPressed: (){
                Fluttertoast.showToast(
                    msg:'막차 시간표로 이동합니다.',
                    gravity: ToastGravity.CENTER);
                final double endA = _scrollControllerA.position.maxScrollExtent;
                final double endB = _scrollControllerB.position.maxScrollExtent;
                _scrollControllerA.animateTo(endA,duration: Duration(milliseconds: 800),curve: Curves.easeIn);
                _scrollControllerB.animateTo(endB,duration: Duration(milliseconds: 800),curve: Curves.easeIn);
              },
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),



    );
  }
}
