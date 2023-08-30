import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class DialogDesignBoxA extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double sizeWidth = 2.42.w;
    double textSize = 3.5.w;
    double contHeight = 16.8.w;

    final stringNumber = ref.watch(lineProvider);

    return Container(
      height: 16.5.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            height: 14.5.w,
            width: 3.6.w,
            child: ColorContainer(
                stringNumber: stringNumber),
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
                Text('Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(
                    DateFormat('MM-dd').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
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
                Text('Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
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
                            : '${filtered}역',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: textSize),
                        overflow: TextOverflow.ellipsis);
                  }
                  return Text('');
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
                Text('Passenger',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize)),
                SizedBox(
                  height: sizeWidth,
                ),
                Text(box.read('name') ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}