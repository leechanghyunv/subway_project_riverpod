// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class DialogDesignBoxA extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double sizeWidth = 2.42.w;
    double contHeight = 16.8.w;

    final line = ref.watch(lineProvider);

    return Container(
      height: 16.5.w,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            height: 14.5.w,
            width: 3.6.w,
            child: ColorContainer(line),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: contHeight,
            width: 12.5.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Date', style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                    DateFormat('MM-dd').format(DateTime.now()),
                    style: dialogABC,
                ),
              ],
            ),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: 17.w,
            width: 17.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Location', style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),


                Consumer(
                    builder: (__,ref,widget){
                  final subwayName = ref.watch(nameProvider);
                  final filtered = subwayName.replaceAll(RegExp(r'\([^()]*\)'), '');
                  if(filtered.isNotEmpty){
                    return Text(
                        filtered == 'SEOUL'
                            ? 'SEOUL'
                            : '$filtered역',
                        style: dialogABC,
                        overflow: TextOverflow.ellipsis);
                  }
                  return Text('SEOUL',style: dialogABC);
                }),

              ],
            ),
          ),

          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: 17.w,
            width: 22.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeWidth,
                ),
                Text('Passenger', style: dialogABC,
                ),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(name,
                    style: dialogABC,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
