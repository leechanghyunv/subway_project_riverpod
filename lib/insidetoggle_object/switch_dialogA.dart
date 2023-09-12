import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';
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

    final weather = ref.watch(weatherProvider);
    final svg = ref.watch(svgProvider);

    return Container(
      height: 90.8.w,
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
                child: Consumer(
                    builder: (context,ref,child){
                  final filted = ref.watch(filtedArrivalProvider(widget.list));
                  return filted.when(
                    loading: () => TextFrame(comment: 'loading.....'),
                    error: (err,stack) => Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFrame(comment: '데이터를 불러올 수 없습니다'),
                      ),
                    ),
                    data: (data){
                      var arrivalA = data.arrival!.where((e) => updnLine1.contains(e.updnLine));
                      var arrivalB = data.arrival!.where((e) => updnLine2.contains(e.updnLine));

                      var subNumber1 = arrivalA.map((e) => '${e.btrainNo}').first;
                      box.write('subNumber1', subNumber1);
                      var subState1 = arrivalA.map((e) => '${e.arvlCd}').first;
                      box.write('subState1', subState1);
                      var subSttus1 = arrivalA.map((e) => '${e.btrainSttus}').first;
                      box.write('state1', subSttus1);
                      var destination1 = arrivalA.map((e) => '${e.trainLineNm}').first;
                      String filtedDestination1 = destination1.split(" - ")[0];
                      box.write('destination1', filtedDestination1);

                      var subNumber2 = arrivalB.map((e) => '${e.btrainNo}').first;
                      box.write('subNumber2', subNumber2);
                      var subState2 = arrivalB.map((e) => '${e.arvlCd}').first;
                      box.write('subState2', subState2);
                      var subSttus2 = arrivalB.map((e) => '${e.btrainSttus}').first;
                      box.write('state2', subSttus2);
                      var destination2 = arrivalB.map((e) => '${e.trainLineNm}').first;
                      String filtedDestination2 = destination2.split(" - ")[0];
                      box.write('destination2', filtedDestination2);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFrame(
                            comment: '\n${widget.line} ${widget.name}역 -> ${widget.dest}역\n',
                          ),
                          TextFrame(comment: data.upfirst.toString()),
                          TextFrame(comment: data.uplast.toString()),
                          TextFrame(comment: data.downfirst.toString()),
                          TextFrame(comment: data.downlast.toString()),
                        ],
                      );
                    },
                  );
                }),
            ),
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
                              fontSize: 3.7.w,
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
