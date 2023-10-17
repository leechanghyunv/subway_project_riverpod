// Project imports:

import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';
import 'layout_screen_table.dart';

/// 출발지점의 시간표를 보여주는 테이블
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
    final table = ref.watch(subTableProvider(ref.watch(codeConveyProvider)));
    /// codeConveyProvider는 지하철 코드임 이 파라미터로 타임 테이블을 불러올 수 있음
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
              onPressed: () => Navigator.pop(context),
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
          /// 지하철 오픈 api에서 받는 시간표 정보에는 시간표 순서로 정렬되어있지 않다는점, 의미없는 기록 00:00:00이 너무 많다는 점이 있어
          /// 모두 필터링한 후에 UI에 나타나도록함 futureProvider 대신에 statenotifeirprovider로 하면 컨트롤러 안에다 필터링된 값들을
          /// 넣고 불러올 수 있을 거라 생
          if(filtedA.isNotEmpty && filtedB.isNotEmpty){
            return TimeTable(
              childA: ListView.builder(
                  controller: _scrollControllerA,
                  itemCount: filtedA.length,
                  itemBuilder:(context, index){
                    var row = filtedA[index];
                    return TableList(
                        row.sname,row.ename, row.express.name,row.arrivetime);
                  }),
              childB: ListView.builder(
                  controller: _scrollControllerB,
                  itemCount: filtedB.length,
                  itemBuilder:(context, index){
                    var row = filtedB[index];
                    return TableList(
                        row.sname,row.ename, row.express.name,row.arrivetime);
                  }),
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
          loading: () => const Center(
            child: TextFrame(comment: 'loading.....')),
          ),
    );
  }
}

Widget TableList(
    String sname, String ename, String express, String arrivetime) =>
    ListTile(
      title: Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                    text: '$sname > $ename행 \n',
                    style: tablecommon,
                  ),
                  TextSpan(
                    text: express == 'GENERAL'
                        ? '$express(일반)'
                        : '$express(급행)',
                    style: tableexstyle(express),
                  ),
                ]
            ),
          ),
        ),
      ],
    ),
      trailing: Text(
        arrivetime.substring(0,5),
        style: commonmin,
      ),
    );



