import 'package:auto_size_text/auto_size_text.dart';
import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class MainText extends ConsumerWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              onTap: () => maintextguide(),
              child: AutoSizeText(name == 'SEOUL' ? 'SEOUL' : '${name}역',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: name.length == 2 ? 33.sp /// 80
                        : name.length == 3 ? 32.sp /// 80
                        : name.length == 4 ? 32.sp /// 80
                        : name.length == 5 ? 32.sp /// 60
                        : name.length == 6 ? 30.sp /// 60
                        : name.length == 7 ? 29.sp /// 45
                        : name.length == 8 ? 27.5.sp /// 45
                        : name.length == 9 ? 26.5.sp /// 45
                        : name.length == 10 ? 26.5.sp /// 45
                        : name.length == 11 ? 24.5.sp /// 45
                        : name.length == 12 ? 24.5.sp /// 45
                        : name.length == 13 ? 24.sp /// 45
                        : 21.5.sp,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            ),
          ),
              Text(
              engName == 'SEOUL' ? ' SEOUL' : ' ${engName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: engName.length < 35 ? 15.sp : 14.sp,
                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
            ),
        ],
      ),
      ),
    );
  }
}
