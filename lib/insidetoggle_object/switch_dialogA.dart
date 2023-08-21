import 'package:subway_project_230704/setting/export.dart';
import '../data_provider/weather_provider.dart';

class SwitchDialogA extends ConsumerStatefulWidget {
  final String name;
  final String list;
  final String dest;
  final String line;

  const SwitchDialogA(this.name, this.list, this.dest, this.line, {super.key});

  @override
  ConsumerState<SwitchDialogA> createState() => _SwitchDialogAState();
}

class _SwitchDialogAState extends ConsumerState<SwitchDialogA> {

  @override
  void initState() {
    super.initState();
    box.write('SubListId', widget.list);
    print('SubListId: ${box.read('SubListId')}');
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    final arrivel = ref.watch(arrivalProvider);
    final weather = ref.watch(weatherProvider);
    final temp = ref.watch(tempProvider);
    final svg = ref.watch(svgProvider);

    return Container(
      height: appWidth * 0.9075,  /// 0.9075
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogDesign(
            designText: 'RealTime Arrival',
          ),
          ToopTipWidget(
            message: ref.watch(routeProvider),
            child: Container(
                color: Colors.grey[100],
                width: double.maxFinite,
                child: arrivel.when(
                  loading: () => TextFrame(comment: 'loading.....'),
                  error: (err, stack) => TextFrame(comment: '데이터를 불러올 수 없습니다'),
                  data: (data) {
                    try {
                      var filtedArrival = data
                          .where((element) => element.subwayId == widget.list).toList();
                      var updnLine1 = ['상행', '내선'], updnLine2 = ['하행', '외선'];
                      /// dp용 /// 상행선 상행선 상행선 상행선 상행선 상행선 상행선 /// /// /// /// ///
                      var updn1First = filtedArrival
                          .where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                      var updn1Last = filtedArrival
                          .where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                      /// dp용 /// 하행선 하행선 하행선 하행선 하행선 하행선 하행선  /// /// /// /// /// ///
                      var updn2First = filtedArrival
                          .where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                      var updn2Last = filtedArrival
                          .where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                      /// 저장용 /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
                      var subNumber1 = filtedArrival.where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.btrainNo}').first;
                      box.write('subNumber1', subNumber1);
                     var subState1 = filtedArrival.where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.arvlCd}').first;
                      box.write('subState1', subState1);

                      var subSttus1 = filtedArrival.where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.btrainSttus}').first;
                      box.write('state1', subSttus1);

                      var destination1 = filtedArrival.where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm}').first;
                      String filtedDestination1 = destination1.split(" - ")[0];
                      box.write('destination1', filtedDestination1);
                      /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
                      var subNumber2 = filtedArrival.where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.btrainNo}').first;
                      box.write('subNumber2', subNumber2);
                      var subState2 = filtedArrival.where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.arvlCd}').first;
                      box.write('subState2', subState2);

                      var subSttus2 = filtedArrival.where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.btrainSttus}').first;
                      box.write('state2', subSttus2);

                      var destination2 = filtedArrival.where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm}').first;
                      String filtedDestination2 = destination2.split(" - ")[0];
                      box.write('destination2', filtedDestination2);
                      /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFrame(
                            comment: '\n${widget.line} ${widget.name}역 -> ${widget.dest}역\n',
                          ),
                          TextFrame(comment: updn1First.toString()),
                          TextFrame(comment: updn1Last.toString()),
                          TextFrame(comment: updn2First.toString()),
                          TextFrame(comment: updn2Last.toString()),
                        ],
                      );
                    } catch (e) {
                      return Container(
                          child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFrame(comment: '${widget.name}역 실시간 데이터를 가져올 수 없습니다.'),
                      ));
                    }
                  },
                )),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.white,
            child: Row(
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
                      return Container(
                          color: Colors.white,
                          child: Text(data.first.description,
                            style: TextStyle(
                              fontSize: appWidth * 0.0362,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    },
                  ),
                  Expanded(child: Text('')),
                  TransferIcon(),

                ],
              ),
          ),

        ],
      ),
    );
  }


}
