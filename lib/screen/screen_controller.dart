import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';
import 'main_screen.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingPage(); /// 2초간 유지후 Layout_Screen으로 넘어감 
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

