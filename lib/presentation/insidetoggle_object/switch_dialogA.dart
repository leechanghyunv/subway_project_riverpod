// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

import '../../data_provider/subordinate_provider/weather_provider.dart';
import '../screen/screen_controller.dart';

/// 실시간 지하철 열차 정보를 보여주기 위한 부분임

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

          ToolTipWidget(
            message: ref.watch(routeProvider),
            child: Container(
                color: Colors.grey[100],
                width: double.maxFinite,
                child: Consumer(
                    builder: (context,ref,child){
                  final filted = ref.watch(filtedArrivalProvider(widget.list));
                  return filted.when(
                    loading: () => LoadingBox('loading.....'),
                    error: (err,stack) => LoadingBox('데이터를 불러올 수 없습니다'),
                    data: (data){
                      ref.read(TrainStateProvider.notifier).filtedTrainstate(data.arrival);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 실시간 지하철 열차 정보를 보여주기 위한 부분임
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
                },
                ),
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
                    error: (err, stack) => const Icon(Icons.question_mark),
                    data: (data){
                      return data;
                    },
                  ),
                  weather.when(
                    loading: () => const Center(
                        child: TextFrame(comment: 'loading.....')),
                    error: (err, stack) => TextFrame(comment: err.toString()),
                    data: (data){
                      return Container(
                          color: Colors.white,
                          child: TextFrame(
                            comment: data.first.description),
                      );
                    },
                  ),
                  const Expanded(child: Text('')),
                  /// 환승역에대한 정보를 저장하기 위한 구간임 사람들이 잘 안쓸것 같아 바꾸고싶음
                  TransferIcon(),
                ],
              ),
          ),

        ],
      ),
    );
  }


}
