import '../setting/export.dart';

class LayoutMainScreen extends StatelessWidget {

  final List<Widget> children1;
  final List<Widget> children2;
  final void Function() onTap;

  LayoutMainScreen({Key? key,
    required this.children1,
    required this.children2,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double frameWidth = appHeight * 0.49;  /// 414.0 IPHONE11
    double appWidth = appHeight * 0.46;  /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    final double dotLength = appRatio >= 0.5 ? 4.5 : 6;
    final double lineThickness = appRatio >= 0.5 ? 5 : 7;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              height: appHeight,
              width: frameWidth,
              child: Column(
                children: <Widget>[
                  TopDesign(),
                  SizedBox(
                    height: appRatio >= 0.5 ? appHeight * 0.665 : appHeight * 0.6,
                    width: appWidth * 0.915,
                    child: Column(
                      children: <Widget>[
                        DottedLine(
                          dashLength: 12, dashGapLength: dotLength, lineThickness: lineThickness,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: children1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: children2
                        ),
                      ],
                    ),
                  ),
                  BottomDesign(
                    key: key,
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
