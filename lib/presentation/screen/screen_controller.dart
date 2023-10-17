// Project imports:

import '../../setting/export.dart';
import '../../setting/export+.dart';
import 'loading_screen/loading_main.dart';
import 'main_screen/main_screen.dart';

final box = GetStorage();

class ScreenController extends ConsumerStatefulWidget {
  const ScreenController({super.key});

  @override
  ConsumerState<ScreenController> createState() => _ScreenControllerState();
}
 class _ScreenControllerState extends ConsumerState<ScreenController>  {
  
   late Future<String> _futureData;
   SharedPreManager sharedPreManager = SharedPreManager();

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
    sharedPreManager.init();
    ref.read(dustLevelProvider);
    /// 미세먼지 농도에 대한 정보를 콜백 미리 콜백해야 HomePage()을 콜백했을때 좌측 컬러바의 색상변경에 딜레이가 없음
    ref.read(locationProvider.notifier).getlocation();
    /// geolocator의 정보를 미리 콜백해야 weatherprovider, latlongprovider의 앖이 변경
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingFrame(); /// 2초간 유지후 Layout_Screen으로 넘어감
          } else {
            if(sharedPreManager.getIsFirst()){
              return LayoutIntro();
              // 첫 번째 빌드에서 LayoutIntro()을 반환
            } else {
              return HomePage();
              // 이후 빌드에서는 항상HomePage()을 반환
            }
          }
        }
        );
  }

}

