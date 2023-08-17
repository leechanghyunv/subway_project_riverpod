


import '../setting/export.dart';

class ToopTipWidget extends StatelessWidget {

  final String? message;
  final Widget? child;

  ToopTipWidget({super.key, this.message, this.child,});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white),
      showDuration: Duration(seconds: 3),
      child: child,
    );
  }
}
