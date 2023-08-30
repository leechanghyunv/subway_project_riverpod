import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  final CollectionReference _dailyComment = FirebaseFirestore.
  instance.collection('daily_comment');
  late Future<DocumentSnapshot> _futureDailyComment;

  @override
  void initState() {
    super.initState();
    _futureDailyComment = _dailyComment.doc('5MOwKsrOSBYEQNpEeSRu').get(); /// one time read operation
  }

  @override
  Widget build(BuildContext context) {

    Widget BlinkComment (String text) => BlinkText(text,
      style: TextStyle(
        fontSize: 2.h,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      duration: Duration(milliseconds: 410), /// 깜빡이는 간격이라고 한다
    );

    bool isFirstBuild = box.read('isFirstBuild') ?? true;
    if (isFirstBuild) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// 당일 특이사항을 전달해줌 (04호선 오전 00시부터 00시까지 시위) /// (이수역 물에 잠김)
              FutureBuilder<DocumentSnapshot>(
                  future: _futureDailyComment,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString(),),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        alignment: Alignment.center,
                        height: 15.h,
                        width: 70.w,
                        child: BlinkComment(snapshot.data['comment']),
                      );
                    }
                    return Center(
                      child: Text(''),
                    );
                  }),
            ],
          ),
        ),
      );
    } else {
      return LayoutScreen(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlinkComment('안녕'),
            ],
          ),
        ),
      );
    }
  }
}