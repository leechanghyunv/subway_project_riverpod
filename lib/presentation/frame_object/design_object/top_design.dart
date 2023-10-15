// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class TopDesign extends StatelessWidget {

  String qrdata = '1234ffov3pp5oq23lk';
  Color text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    if(Device.aspectRatio >= 0.5){
      return Container_Se();
    }
    return Container_nomal();
  }
}

Widget Container_Se() =>
    Container(
      color: Colors.white,
      height:  20.h,
      child: Row(
        children: <Widget>[
          SizedBox(width: 1.5.h),
          Padding(
            padding: const EdgeInsets.all(6.0),
                child: QrImageView(data: '1234ffov3pp5oq23lk')
          ),
          SizedBox(
            width: 3.h, /// 520
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                DateFormat('y-MM-dd EEE').format(DateTime.now()),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:  19.9.sp, /// 520
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,  /// 520
              ),
              Container(
                height: 11.2.h, /// 520
                width: 26.h, /// 378.8
                child: GestureDetector(
                  child: BarcodeWidget(
                    color: Colors.black,
                    data: 'FR9XZ227A93V6',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp), /// 520
                    barcode: Barcode.code93(),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );

Widget Container_nomal() =>
    Container(
      color: Colors.white,
      height:  17.h,
      child: Row(
        children: <Widget>[
          SizedBox(width: 1.5.h),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: QrImageView(data: '1234ffov3pp5oq23lk'),
          ),
          SizedBox(width: 3.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                DateFormat('y-MM-dd EEE').format(DateTime.now()),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Device.aspectRatio >= 0.5 ? 20.5.sp : 19.sp, /// 520
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,  /// 520
              ),
              Container(
                height: 10.h, /// 520
                width: Device.aspectRatio >= 0.5 ? 20.5.h : 21.5.h, /// 378.8
                child: GestureDetector(
                  child: BarcodeWidget(
                    color: Colors.black,
                    data: 'FR9XZ227A93V6',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp), /// 520
                    barcode: Barcode.code93(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
