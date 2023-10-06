// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class BottomDesign extends StatelessWidget {

  final void Function()? onTap;

  const BottomDesign({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 15.w,
            height: Device.aspectRatio >= 0.5 ? 12.h : 11.h,
            color: Colors.transparent,
          ),
          GestureDetector(
            onTap: (){
            },
            child: Container(
                alignment: Alignment.center,
                width: 55.w,
                height: Device.aspectRatio >= 0.5 ? 12.h : 11.h,
                child: BarcodeWidget(
                  data: '------LAFAYETTE.co-------',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Device.aspectRatio >= 0.5
                        ? 2.1.h
                        : 1.8.h,
                  ),
                  color: Colors.black,
                  barcode: Barcode.code128(),
                )),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 3),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 15.w,
                  height: Device.aspectRatio >= 0.5 ? 12.h : 11.h,
                  color: Colors.transparent,
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
