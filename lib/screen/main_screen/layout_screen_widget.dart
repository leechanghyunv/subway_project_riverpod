// Package imports:
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

// Project imports:
import '../../setting/export+.dart';
import '../../setting/export.dart';
import 'layout_main.dart';
import 'layout_se.dart';

class LayoutMainScreen extends StatefulWidget {

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
  State<LayoutMainScreen> createState() => _LayoutMainScreenState();
}

class _LayoutMainScreenState extends State<LayoutMainScreen> {

  String _authStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().
    addPostFrameCallback((_) => initPlugin().
    then((value) => initialmsg()));
  }

  Future<void> initPlugin() async {
    final TrackingStatus status =
    await AppTrackingTransparency.trackingAuthorizationStatus;
    setState(() => _authStatus = '$status');
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
      setState(() => _authStatus = '$status');
    }
    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: DialogDesign(designText: 'Dear User'),
          content: TextFrame(
            comment: 'We care about your privacy and data security. We use data showing NAVER_Map and displaying subway list sorted by proximity to the device'
              ' Can we continue to use your data?\n\nYou can change your choice anytime in the app settings. '
              'We will collect Location data and use a unique identifier on your device.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: TextFrame(
                comment: 'Continue',
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    if(Device.aspectRatio >= 0.5){
      return Layout_Se(
        widget.colorBar,
        widget.dropDown,
        widget.iconCustom,
        widget.upandDown,
        widget.toggleCustom,
        widget.onTap,
      );
    }else{
      return Layout_Main(
        widget.colorBar,
        widget.dropDown,
        widget.iconCustom,
        widget.upandDown,
        widget.toggleCustom,
        widget.onTap,
      );
    }
  }
}


