import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmsFunction extends StatelessWidget {

  final String subwayline;

  const SmsFunction({Key? key, required this.subwayline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11


    return TextButton(
      onPressed: () async {
        if (subwayline == 'Line1' || subwayline == 'Line2' ||
            subwayline == 'Line3' || subwayline == 'Line4' ||
            subwayline == 'Line5' || subwayline == 'Line6' ||
            subwayline == 'Line7' || subwayline == 'Line8') {
          Uri url = Uri.parse('sms:+8215771234');/// 1~8호선
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        } else if (subwayline =='Line9') {
          Uri url = Uri.parse('sms:+8215444009');/// 9호선
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        } else if (subwayline =='신분당선') {
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
            fontSize: appHeight * 0.0168,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}