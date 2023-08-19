import 'package:subway_project_230704/setting/export.dart';
import 'package:intl/intl.dart';

class TopDesign extends StatelessWidget {

  String qrdata = '1234ffov3pp5oq23lk';
  Color text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appHeight * 0.462 * 0.915;

    return Container(
      color: Colors.transparent,
      height: appHeight * 0.17,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: mainBoxWidth / 40,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
                onTap: () {
                  box.remove('iconbuttonguide');
                  box.remove('iconbuttonguide2');
                  box.remove('toggleguide');
                  box.remove('toggleguide2');
                  box.remove('smsguide');
                  box.remove('barguide');
                  print('QRCODE');
                },
                child: QrImageView(data: qrdata)),
          ),
          SizedBox(
            width: mainBoxHeight / 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mainBoxHeight / 25,
              ),
              Row(
                children: [
                  Text(
                    DateFormat('y-MM-dd EEE').format(DateTime.now()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:  mainBoxHeight / 25,
                        color: text_color),
                  ),
                  SizedBox(
                    width: mainBoxHeight / 50,
                  ),
                ],
              ),
              SizedBox(
                height: mainBoxHeight / 50,
              ),
              Container(
                height: mainBoxHeight / 7,
                width: mainBoxWidth / 2.2,
                child: GestureDetector(
                  child: BarcodeWidget(
                    color: text_color,
                    data: 'FR9XZ227A93V6',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight / 35),
                    barcode: Barcode.code93(),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
