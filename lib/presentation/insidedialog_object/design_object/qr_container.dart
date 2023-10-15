// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class DialogDesign extends StatelessWidget {

  late final String designText;

  DialogDesign({
    required this.designText,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Container(
            width: 19.3.w,
            height: 19.3.w,
            child: QrImageView(
              data: qrdata,
            ),
          ),
          SizedBox(
            width: 3.88.w,
          ),   ///appHeight * 0.0280

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFrame(
                comment: designText,
                overflow: TextOverflow.ellipsis,
              ),

              TextFrame(
                comment: DateFormat('y-MM-dd EEE').
                format(DateTime.now())),
              TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  return TextFrame(
                      comment: formatDate(DateTime.now(),
                          [am , ' ', hh, ':', nn, ':', ss, ' '])
                  );
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}
