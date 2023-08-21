import '../data_provider/weather_provider.dart';
import '../setting/export.dart';


class LayoutTable extends ConsumerWidget {

   final Widget? child;
  Widget? floatingActionButton;

  LayoutTable({Key? key,
     this.child,
    this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;  /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Center(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: appHeight,
                width: appRatio >= 0.5 ? appHeight * 0.49 :  double.maxFinite,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Consumer(builder: (__,ref,widget){
                        final weather = ref.watch(weatherProvider);
                        final temp = ref.watch(tempProvider);
                        final svg = ref.watch(svgProvider);
                        return Container(
                          color: Colors.grey[300],
                          width: appRatio >= 0.5 ? appHeight * 0.49 :  double.maxFinite,
                          alignment: Alignment.centerLeft,
                          height: appWidth * 0.1449,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5,),
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
                                      return TextFrame(
                                          comment: '${(data.temp- 273.15).toStringAsFixed(0)}\u2103');
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
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: floatingActionButton,
        )
    );
  }
}
