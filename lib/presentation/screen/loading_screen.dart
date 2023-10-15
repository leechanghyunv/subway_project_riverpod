// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class IrregularEvent extends StatefulWidget {
  const IrregularEvent({Key? key}) : super(key: key);
  @override
  State<IrregularEvent> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<IrregularEvent> {
  final CollectionReference _dailyComment =
      FirebaseFirestore.instance.collection('daily_comment');
  late Future<DocumentSnapshot> _futureDailyComment;

  @override
  void initState() {
    super.initState();
    _futureDailyComment = _dailyComment.doc('5MOwKsrOSBYEQNpEeSRu').get();
  }

  @override
  Widget build(BuildContext context) {
    /// 당일 특이사항을 전달해줌 (04호선 오전 00시부터 00시까지 시위) /// (이수역 물에 잠김)
    return FutureBuilder<DocumentSnapshot>(
        future: _futureDailyComment,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return SizedBox.shrink();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlinkComment(
                     snapshot.data['comment'],3.7.w,
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        });
  }
}
