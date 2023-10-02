import 'package:subway_project_230704/setting/export.dart';

Future<String> fetchData() async {
  await Future.delayed(Duration(milliseconds: 1100));
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


void accident(){
  if(box.read('accident') ?? true){
    Fluttertoast.showToast(
        msg:'불규칙한 정보 ex)지하철 파업, 열차고장,사고는\n어플 열람시 첫 화면에 보이는 텍스트로 알려드립니다.',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5
    );
    box.write('accident', false);
  }
  print('${box.read('initialmsg') ?? ''}');
}


void initialmsg(){
  if(box.read('initialmsg') ?? true){
    Fluttertoast.showToast(
      msg:'앱 안에있는 모든 글자와 아이콘을 눌러보세요',
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5
    );
    box.write('initialmsg', false);
    print('${box.read('initialmsg') ?? ''}');
  } else {
    print('${box.read('initialmsg') ?? ''}');
  }
}

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
        msg:'지하철역명 탭으로 열차 위치 확인\n\n왼쪽으로 스와이프하면 지하철민원\n오른쪽으로 스와이프시 네이버지도 ',
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

void maintextguide(){
  if(box.read('maintextguide') ?? true){
    Fluttertoast.showToast(
      msg:'목적지를 누르시면 이동경로,이동시간을 알려줍니다\n지하철 이동시간이 너무 길면 다른 경로를 소개합니다',
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
    box.write('maintextguide', false);
    print('${box.read('maintextguide') ?? ''}');
  }else{
    print('${box.read('maintextguide') ?? ''}');
  }
}

void tableguide(){
  Fluttertoast.showToast(
    msg:'LAFAYETTE 로고의 오른쪽을 빈공간을 탭하시면 출발지점의 시간표를 보실 수 있습니다.',
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 5,
  );
}





