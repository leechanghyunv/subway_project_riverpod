import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import '../custom/text_frame.dart';

class DialogDesign extends StatelessWidget {

  String qrdata = '1234ffov3pp5oq23lk';

  late final String designText;

  DialogDesign({
    required this.designText,
  });

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height; /// 896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width; /// 896.0 IPHONE11
    return Container(

      child: Row(
        children: [
          Container(
            width: appWidth * 0.1932,  /// 80 /// 0.893
            height: appWidth * 0.1932,
            child: QrImageView(
              data: qrdata,
            ),
          ),
          SizedBox(
            width: appWidth * 0.0388,
          ),   ///appHeight * 0.0280

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              TextFrame(
                comment: '${designText}',
                overflow: TextOverflow.ellipsis,
              ),

              TextFrame(
                comment: DateFormat('y-MM-dd EEE').
                format(DateTime.now()),),
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