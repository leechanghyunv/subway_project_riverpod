
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../setting/InitivalValue.dart';

class MainText extends ConsumerWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double mainBoxHeight = appHeight * 0.58;
    final name = ref.watch(nameProvier);
    final engName = ref.watch(engNameProvier);
    return Container(
      height: appHeight * 0.58 * 0.75,
      child: RotatedBox(
        quarterTurns: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name == 'SEOUL' ? 'SEOUL' : '${name}역',
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: name.length == 2 ? mainBoxHeight / 8/// 80
                    : name.length == 3 ? mainBoxHeight / 8.5/// 80
                    : name.length == 4 ? mainBoxHeight / 8.5/// 80
                    : name.length == 5 ? mainBoxHeight / 8.6/// 60
                    : name.length == 6 ? mainBoxHeight / 8.6/// 60
                    : name.length == 7 ? mainBoxHeight / 11.4/// 45
                    : name.length == 8 ? mainBoxHeight / 11.4/// 45
                    : mainBoxHeight / 14.4,
                overflow: TextOverflow.ellipsis,
              )),
              Text(
              engName == 'SEOUL' ? ' SEOUL' : ' ${engName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: engName.length < 35 ?
                  mainBoxHeight / 35 : mainBoxHeight / 40,
                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
            ),
        ],
      ),
      ),
    );
  }
}
