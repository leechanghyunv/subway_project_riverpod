import 'package:subway_project_230704/setting/export.dart';

Future<String> fetchData() async {
  await Future.delayed(Duration(milliseconds: 1950));
  return "Data loaded successfully";
}

Future<bool?> savemsg(String position, String name, String ename) async => await
Fluttertoast.showToast(
        msg:'${position} ${name}역 저장되었습니다.\n${ename}',
        gravity: ToastGravity.CENTER);

Future<bool?> savemsg2(String name) async => await
Fluttertoast.showToast(
        msg:'환승역 ${name}역 저장되었습니다',
        gravity: ToastGravity.CENTER);

Future<bool?> tablemsg(String eng,String name) async => await
Fluttertoast.showToast(
        msg:'${eng} ${name}',
        gravity: ToastGravity.CENTER);

Future<bool?> tableLast(String name) async => await
Fluttertoast.showToast(
        msg:'${name}역 막차 시간표로 이동합니다.',
        gravity: ToastGravity.CENTER);

Future<bool?> serveymsg() async => await
Fluttertoast.showToast(
        msg:'의견이 전달되었습니다',
        gravity: ToastGravity.CENTER);

Future<bool?> Select(String name) async => await
Fluttertoast.showToast(
        msg:'${name}역을 선택하셨습니다',
        gravity: ToastGravity.CENTER);

Future<bool?> showmsg() => Fluttertoast.showToast(
    msg:'목적지를 입력해주세요',
    gravity: ToastGravity.CENTER);


/// guide guide guide guide guide guide guide guide guide guide

 void iconbuttonguide(){
   if(box.read('iconbuttonguide') ?? true){
     Fluttertoast.showToast(
       msg:'목적지 저장은 Save 버튼으로 합니다.\n출발지 저장은 Save버튼을 길게 눌러주세요',
       gravity: ToastGravity.CENTER,
       toastLength: Toast.LENGTH_LONG,
       timeInSecForIosWeb: 5,
     );
     box.write('iconbuttonguide', false);
     print('${box.read('iconbuttonguide') ?? ''}');
   } else {
     print('${box.read('iconbuttonguide') ?? ''}');
   }
}

void iconbuttonguide2(){
  if(box.read('iconbuttonguide2') ?? true){
    Fluttertoast.showToast(
      msg:'목적지 저장은 Save 버튼으로 합니다\n출발지 저장은 Save 버튼을 길게 눌러주세요\n중간에 환승역 저장가능',
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
    box.write('iconbuttonguide2', false);
    print('${box.read('iconbuttonguide2') ?? ''}');
  } else {
    print('${box.read('iconbuttonguide2') ?? ''}');
  }
}

void toggleguide(){
  if(box.read('toggleguide') ?? true){
    Fluttertoast.showToast(
        msg:'Adapt는 도착시간 계산, 도착시간 알림',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
    );
    box.write('toggleguide', false);
    print('${box.read('toggleguide') ?? ''}');
  } else {
    print('${box.read('toggleguide') ?? ''}');
  }

}

void toggleguide2(){
  if(box.read('toggleguide2') ?? true){
    Fluttertoast.showToast(
        msg:'지하철역명을 탭하면 목적지 저장이 가능합니다\n좌우 스와이프로 더 많은 기능을 이용하세요 ',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
    );
    box.write('toggleguide2', false);
    print('${box.read('toggleguide2') ?? ''}');
  }else{
    print('${box.read('toggleguide2') ?? ''}');
  }
}

void smsguide(){
  if(box.read('smsguide') ?? true){
    Fluttertoast.showToast(
        msg:'복사된 출발정보는 자동 붙여넣기 되어있습니다\n메시지 보내실때 편하게 문의사항 입력가능합니다',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
    );
    box.write('smsguide', false);
    print('${box.read('smsguide') ?? ''}');
  }else{
    print('${box.read('smsguide') ?? ''}');
  }
}

void barguide(){
  if(box.read('barguide') ?? true){
    Fluttertoast.showToast(
        msg:'컬러바의 색상은 미세먼지 농도에 따라 바뀜니다\n\n4호선 파란색,2호선 초록색은 미세먼지농도 적음\n\n3호선 주황색,8호선 붉은색은 미세먼지농도 심각',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
    );
    box.write('barguide', false);
    print('${box.read('barguide') ?? ''}');
  }else{
    print('${box.read('barguide') ?? ''}');
  }
}