import 'package:subway_project_230704/setting/export.dart';
import '../data_provider/timetable_provider.dart';
import 'layout_screen_table.dart';

class TableScreen extends ConsumerStatefulWidget {

  final subName;
  final engName;

  const TableScreen(this.subName, this.engName);

  @override
  ConsumerState<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends ConsumerState<TableScreen> {
  ScrollController _scrollControllerA = ScrollController();
  ScrollController _scrollControllerB = ScrollController();

  @override
  void initState() {
    super.initState();
    tablemsg(widget.engName,widget.subName);
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;  /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double containerWidth = appRatio >= 0.5 ? appHeight * 0.49 : appWidth;
    double textSize = appRatio >= 0.5 ? appWidth * 0.0255 : appWidth * 0.0289;

    final tableA = ref.watch(subTableProviderA(ref.watch(codeConveyProvider)));
    final tableB = ref.watch(subTableProviderB(ref.watch(codeConveyProvider)));

    return LayoutTable(
      child: Consumer(
          builder: (__,ref,widget){
            tableA.value?.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
            tableB.value?.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
            var filtedtableA = tableA.value?.where((e) => e.arrivetime != '00:00:00').toList();
            var filtedtableB = tableB.value?.where((e) => e.arrivetime != '00:00:00').toList();
            if(filtedtableA != null && filtedtableB != null){
              return Row(
                children: [
                  Container(
                    width: containerWidth * 0.5,
                    height: appHeight * 0.90,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        controller: _scrollControllerA,
                        itemCount: filtedtableA.length,
                        itemBuilder:(context, index){
                          var row = filtedtableA[index];
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
                                                fontSize: textSize,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                          TextSpan(
                                            text:'${row.express.name == 'GENERAL'
                                                ? '${row.express.name}(일반)'
                                                : '${row.express.name}(급행)'}',
                                            style: TextStyle(
                                                fontSize: textSize,
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
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),

                  ),
                  Container(
                    width: containerWidth * 0.5,
                    height: appHeight * 0.90,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        controller: _scrollControllerB,
                        itemCount: filtedtableB.length,
                        itemBuilder:(context, index){
                          var row = filtedtableB[index];
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
                                                fontSize: textSize,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                          TextSpan(
                                            text:'${row.express.name == 'GENERAL'
                                                ? '${row.express.name}(일반)'
                                                : '${row.express.name}(급행)'}',
                                            style: TextStyle(
                                                fontSize: textSize,
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
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            return TextFrame(comment: '현재 외부로부터 시간 데이터를 제공받을 수 없습니다.');
      }),
        floatingActionButton: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(
                  appRatio >= 0.5
                      ? Alignment.bottomRight.x - 0.1
                      : Alignment.bottomRight.x,

                  Alignment.bottomRight.y - 0.2
              ),
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
                  size: appWidth * 0.0602,
                ),
              ),
            ),

            Align(
              alignment: Alignment(
                  appRatio >= 0.5
                      ? Alignment.bottomRight.x - 0.1
                      : Alignment.bottomRight.x,

                  Alignment.bottomRight.y
              ),
              child: FloatingActionButton.small(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                elevation: 0.1,
                onPressed: (){
                  tableLast(widget.subName);
                  final double endA = _scrollControllerA.position.maxScrollExtent;
                  final double endB = _scrollControllerB.position.maxScrollExtent;
                  _scrollControllerA.animateTo(endA,duration: Duration(milliseconds: 800),curve: Curves.easeIn);
                  _scrollControllerB.animateTo(endB,duration: Duration(milliseconds: 800),curve: Curves.easeIn);
                },
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: appWidth * 0.0602,
                ),
              ),
            ),
          ],
        ),
    );


  }
}
