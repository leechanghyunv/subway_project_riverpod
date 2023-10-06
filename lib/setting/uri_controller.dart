// Project imports:
import 'package:subway_project_230704/setting/export.dart';

class SmsFunction extends StatelessWidget {

  final String line;

  const SmsFunction({Key? key, required this.line}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () async {

        if (line == 'Line1' || line == 'Line2' ||
            line == 'Line3' || line == 'Line4' ||
            line == 'Line5' || line == 'Line6' ||
            line == 'Line7' || line == 'Line8') {
          Uri url = Uri.parse('sms:+8215771234');/// 1~8호선
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        } else if (line =='Line9') {
          Uri url = Uri.parse('sms:+8215444009');/// 9호선
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        } else if (line =='신분당선') {
          Uri url = Uri.parse('sms:+8203180187777');/// 신분당선
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        }
        Uri url =Uri.parse('sms:+821544-7769');/// 공항철도,경희철도 등등
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }

        Navigator.pop(context);
      },
      child: Text('Send SMS',
        style: TextStyle(
            fontSize: appWidth * 0.0362,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
}
