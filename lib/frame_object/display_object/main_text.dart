import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class MainText extends ConsumerWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double mainBoxHeight = appHeight * 0.58;
    final name = ref.watch(nameProvider);
    final time = ref.watch(timeProvider);
    final fare = ref.watch(costProvider);
    final engName = ref.watch(engNameProvider);
    final firstRoute = ref.watch(routeProvider);
    final secondRoute = ref.watch(secondRouteProvider);
    final secondRoad = ref.watch(secondRoadProvider);
    final secondfare = ref.watch(secondCostProvider);
    final secondTime = ref.watch(secondtimeProvider);

    return Container(
      height: Device.aspectRatio >= 0.5 ? 50.3.h : 44.5.h,
      child: RotatedBox(
        quarterTurns: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tooltip(
            message: firstRoute == ''
                ? '${secondRoute}\n${secondRoad}\n운행요금: ${secondfare}원\n소요시간: ${(secondTime/60).toStringAsFixed(0)}분'
                : '${firstRoute}\n운행요금: ${fare}원\n소요시간: ${(time/60).toStringAsFixed(0)}분',
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
            child: GestureDetector(
              onTap: (){
                maintextguide();
              },
              child: Text(name == 'SEOUL' ? 'SEOUL' : '${name}역',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: name.length == 2 ? mainBoxHeight / 7.5/// 80
                        : name.length == 3 ? mainBoxHeight / 8/// 80
                        : name.length == 4 ? mainBoxHeight / 8/// 80
                        : name.length == 5 ? mainBoxHeight / 8/// 60
                        : name.length == 6 ? mainBoxHeight / 9/// 60
                        : name.length == 7 ? mainBoxHeight / 10/// 45
                        : name.length == 8 ? mainBoxHeight / 11/// 45
                        : name.length == 9 ? mainBoxHeight / 11/// 45
                        : name.length == 10 ? mainBoxHeight / 11/// 45
                        : name.length == 11 ? mainBoxHeight / 13/// 45
                        : name.length == 12 ? mainBoxHeight / 13/// 45
                        : name.length == 13 ? mainBoxHeight / 15/// 45
                        : mainBoxHeight / 18,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            ),
          ),
              Text(
              engName == 'SEOUL' ? ' SEOUL' : ' ${engName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: engName.length < 35 ? mainBoxHeight / 35 : mainBoxHeight / 45,
                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
            ),
        ],
      ),
      ),
    );
  }
}
