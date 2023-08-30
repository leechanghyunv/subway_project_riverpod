import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class DialogDesignBoxA extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appWidth = MediaQuery.of(context).size.width;

    double sizeWidth = appWidth * 0.0242;
    double textSize = appWidth * 0.0362;
    double contHeight = appWidth * 0.1686;

    final stringNumber = ref.watch(lineProvider);

    return Container(
      height: appWidth * 0.1449,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            height: appWidth * 0.1449,
            width: appWidth * 0.0362,
            child: ColorContainer(
                stringNumber: stringNumber),
          ),
          SizedBox(
            width: sizeWidth,
          ),
          Container(
            height: contHeight,
            width: appWidth * 0.1256,
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
            height: appWidth * 0.1686,
            width: appWidth * 0.1686,
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
                  if(subwayName.isNotEmpty){
                    return Text(
                        subwayName == 'SEOUL'
                            ? 'SEOUL'
                            : '${subwayName}역',
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
            height: appWidth * 0.1686,
            width: appWidth * 0.2174,
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