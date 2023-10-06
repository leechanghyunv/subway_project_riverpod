// Project imports:
import '../setting/export.dart';

final apiCodeProvider = FutureProvider<List<CodeModel>>((ref) async {

  final subwayInfo = ref.watch(infoProvider);
  final apiservice = SeoulApiService.create();

  var name = subwayInfo.elementAtOrNull(0)?.subname;

  if(name == '서울'){
    name = '서울역';
  }

  final nameWithoutParentheses = name?.replaceAll(RegExp(r'\([^()]*\)'), '');
  final response = await apiservice.getCode(nameWithoutParentheses!);
  if(response.statusCode == 200){
    final List<dynamic> jsonBody = jsonDecode(response.body)['SearchInfoBySubwayNameService']['row'];
    print('codeProvider 저장완료');
    return jsonBody.map((e) => CodeModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load code data');
  }
});
