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
    final tableA = ref.watch(subTableProviderA(ref.watch(codeConveyProvider)));
    final tableB = ref.watch(subTableProviderB(ref.watch(codeConveyProvider)));

    return LayoutTable(
      child: tableA.when(
        loading: () => const Center(
            child: TextFrame(comment: 'loading.....')),
        error: (err, stack) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFrame(
                  comment: '${widget.subName}역 데이터를 제공받을 수 없습니다.'),
            ),
          ],
        ),
        data: (table){
          tableA.value?.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
          tableB.value?.sort((a,b)=>a.arrivetime.compareTo(b.arrivetime));
          var filtedtableA = tableA.value?.where((e) => e.arrivetime != '00:00:00').toList();
          var filtedtableB = tableB.value?.where((e) => e.arrivetime != '00:00:00').toList();
          if(filtedtableA != null && filtedtableB != null){
            return Row(
              children: [
                Container(
                  width: 50.w,
                  height: 90.h,
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
      ),
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


    );


  }
}
