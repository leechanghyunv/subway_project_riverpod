import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';
import 'layout_screen_table.dart';

class TableScreen extends ConsumerStatefulWidget {

  final subName;
  final engName;

  const TableScreen(this.subName, this.engName, {super.key});

  @override
  ConsumerState<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends ConsumerState<TableScreen> {
  final ScrollController _scrollControllerA = ScrollController();
  final ScrollController _scrollControllerB = ScrollController();

  @override
  void initState() {
    super.initState();
    tablemsg(widget.engName,widget.subName);
  }

  @override
  Widget build(BuildContext context) {
    double textSize =  2.8.w;
    final table = ref.watch(subTableProvider(ref.watch(codeConveyProvider)));
    return LayoutTable(
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x,
                Alignment.bottomRight.y - 0.2
            ),
            child: FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              elevation: 0.1,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_return,
                color: Colors.white,
                size: 6.w,
              ),
            ),
          ),

          Align(
            alignment: Alignment(
                Alignment.bottomRight.x,
                Alignment.bottomRight.y
            ),
            child: FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              elevation: 0.1,
              onPressed: (){
                tableLast(widget.subName);
                final double endA = _scrollControllerA.position.maxScrollExtent;
                final double endB = _scrollControllerB.position.maxScrollExtent;
                _scrollControllerA.animateTo(
                    endA,duration: const Duration(milliseconds: 800),curve: Curves.easeIn);
                _scrollControllerB.animateTo(
                    endB,duration: const Duration(milliseconds: 800),curve: Curves.easeIn);
              },
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 6.w,
              ),
            ),
          ),
        ],
      ),
      child: table.when(
        data: (subTable){
          List<TableModel> subTableA = List.from(subTable.tableA);
          List<TableModel> subTableB = List.from(subTable.tableB);
          subTableA.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
          subTableB.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
          var filtedA = subTableA.where((e) => e.arrivetime != '00:00:00').toList();
          var filtedB = subTableB.where((e) => e.arrivetime != '00:00:00').toList();
          if(filtedA.isNotEmpty && filtedB.isNotEmpty){
            return Row(
              children: [
                  Container(
                    width: 50.w,
                    height: 90.h,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        controller: _scrollControllerA,
                        itemCount: filtedA.length,
                        itemBuilder:(context, index){
                          var row = filtedA[index];
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
                                            text:row.express.name == 'GENERAL'
                                                ? '${row.express.name}(일반)'
                                                : '${row.express.name}(급행)',
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
                              row.arrivetime.substring(0,5),
                              style: TextStyle(
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),

                  ),
                  Container(
                    width: 50.w,
                    height: 90.h,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        controller: _scrollControllerB,
                        itemCount: filtedB.length,
                        itemBuilder:(context, index){
                          var row = filtedB[index];
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
                                            text:row.express.name == 'GENERAL'
                                                ? '${row.express.name}(일반)'
                                                : '${row.express.name}(급행)',
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
          },
          error: (err,stack) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFrame(comment: '${widget.subName}역 데이터를 제공받을 수 없습니다.'),
              ),
            ],
          ),
          loading: () => Center(
            child: TextFrame(comment: 'loading.....')),
          ),
    );
  }
}
