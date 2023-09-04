import '../setting/export.dart';

final box = GetStorage();

class LayoutScreen extends StatelessWidget {

  final Widget? body;
  Widget? floatingActionButton;

   LayoutScreen({Key? key,
     this.body,
     this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: body,
          floatingActionButton: floatingActionButton,
        )
    );
  }
}
