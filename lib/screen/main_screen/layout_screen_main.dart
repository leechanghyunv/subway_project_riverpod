import '../../setting/export.dart';
import '../../setting/export+.dart';

class LayoutMainScreen extends StatelessWidget {

  final Widget colorBar;
  final Widget dropDown;
  final Widget iconCustom;
  final Widget upandDown;
  final Widget toggleCustom;
  final void Function() onTap;

  LayoutMainScreen({Key? key,
    required this.colorBar,
    required this.dropDown,
    required this.iconCustom,
    required this.upandDown,
    required this.toggleCustom,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Device.aspectRatio >= 0.5){
      return MainLayout_Se(
        colorBar,
        dropDown,
        iconCustom,
        upandDown,
        toggleCustom,
        onTap,
      );
    }else{
      return MainLayout(
        colorBar,
        dropDown,
        iconCustom,
        upandDown,
        toggleCustom,
        onTap,
      );
    }
  }
}


Widget MainLayout_Se(
    Widget colorBar,
    Widget dropDown,
    Widget iconCustom,
    Widget upandDown,
    Widget toggleCustom,
    void Function()? ontap
    ) => Scaffold(
  resizeToAvoidBottomInset: false,
  body: Container(
    alignment: Alignment.center,
    color: Colors.white,
    height: 100.h,
    width: 100.w,
    child: Column(
      children: <Widget>[
        TopDesign(),
        SizedBox(
          width: 88.5.w,
          child:  Column(
            children: <Widget>[
              DottedLine(
                dashLength: 12, dashGapLength: 4.5, lineThickness: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  colorBar,
                  SizedBox(
                    width: 2.w,
                  ),
                  dropDown,
                  SizedBox(
                    width: 8.5.w,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5.5.w,
                      ),
                      SizedBox(
                          width: 36.2.w,
                          child: iconCustom
                      ),
                      SizedBox(
                        height: 3.5.w,
                      ),
                      TextContainerA(),
                      upandDown,
                      // SizedBox(height: 20,),
                      TextContainerB(),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  toggleCustom,
                ],
              ),
              SizedBox(
                height: 3.w,
              ),
              BottomDesign(
                onTap: ontap,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);


Widget MainLayout(
    Widget colorBar,
    Widget dropDown,
    Widget iconCustom,
    Widget upandDown,
    Widget toggleCustom,
    void Function()? ontap,
    ) => SafeArea(
  child: Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 100.h,
      width: 100.w,
      child: Column(
        children: <Widget>[
          TopDesign(),
          Container(
            color: Colors.white,
            width: 91.5.w,
            child:  Column(
              children: <Widget>[
                DottedLine(
                  dashLength: 12, dashGapLength: 6, lineThickness: 7,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      colorBar, ///
                      SizedBox(
                        width: 2.4.w,
                      ),
                      dropDown,
                      SizedBox(
                        width: 8.5.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 6.w,
                          ),
                          SizedBox(
                            width: 36.2.w,
                            child: iconCustom,
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          TextContainerA(),
                          upandDown,
                          TextContainerB(),
                        ],
                      ),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    toggleCustom,
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                BottomDesign(
                  onTap: ontap,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

