// Project imports:
import '../../../data_provider/subordinate_provider/weather_provider.dart';
import '../../../setting/export.dart';
import '../../../setting/export+.dart';
/// 출발지점의 시간표를 보여주는 테이블 레이아웃에 시간정보 날씨정보를 보여주기위해만든 부분임
class LayoutTable extends ConsumerWidget {

   final Widget? child;
  Widget? floatingActionButton;

  LayoutTable({Key? key,
     this.child,
    this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 100.h,
                width: double.maxFinite,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Consumer(
                          builder: (__,ref,widget){
                        final weather = ref.watch(weatherProvider);
                        final temp = ref.watch(tempProvider);
                        final svg = ref.watch(svgProvider);
                        return Container(
                          color: Colors.grey[300],
                          width:  double.maxFinite,
                          alignment: Alignment.centerLeft,
                          height: 14.4.w, /// appWidth * 0.1449,
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  svg.when(
                                    loading: () => const Center(
                                        child: TextFrame(comment: 'loading.....')),
                                    error: (err, stack) => Icon(Icons.question_mark),
                                    data: (data){
                                      return data;
                                    },
                                  ),
                                  weather.when(
                                    loading: () => const Center(
                                        child: TextFrame(comment: 'loading.....')),
                                    error: (err, stack) => TextFrame(comment: err.toString()),
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
                                      return TextFrame(
                                          comment: '${(data.temp- 273.15).toStringAsFixed(0)}\u2103'
                                      );
                                    },
                                  ),
                                  Expanded(child: Text('')),
                                  TimerBuilder.periodic(
                                    const Duration(seconds: 1),
                                    builder: (context) {
                                      return Row(
                                        children: [
                                          TextFrame(
                                              comment: formatDate(
                                                  DateTime.now(),
                                                  ['',am ,' ',HH, ':', nn, ':', ss, ' '])
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 15,),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: child,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          floatingActionButton: floatingActionButton,
        )
    );
  }
}
