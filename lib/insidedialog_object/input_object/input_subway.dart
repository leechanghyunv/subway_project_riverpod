import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subway_project_230704/setting/export.dart';

class InputSubway extends StatelessWidget {

  final void Function(String)? onSelected;

  InputSubway({
    Key? key,
    this.onSelected}) : super(key: key);

  static String displayStringForOptionB (String e) => e;

  @override
  Widget build(BuildContext context) {

    double iconSize = 6.w;
    double textSize = 3.62.w;

    return Consumer(
        builder: (context, ref, child){
          final subwayData = ref.watch(dataProviderInside);
          return subwayData.when(
            loading: () => Container(
                width: 61.w,
                height: 15.6.w,
                child: TextFrame(comment: 'Loading.....')),
            error: (err, stack) => Text(err.toString()),
            data: (data) {
              final filteredname = data.map((e) => e.subname).toSet().toList();
              return Container(
                width: 61.w,
                height: 15.6.w,
                child: RawAutocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue){
                    return filteredname.where((String option) {
                      return option.contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  displayStringForOption: displayStringForOptionB,
                  fieldViewBuilder: (
                      BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted,
                      ){
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: '입력 후 완료버튼을 누르세요',
                        labelText: 'Enter Destination',
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(fontSize: textSize),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.subway,
                          size: iconSize,
                          color: Colors.black,
                        ),
                        suffixIcon: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10.0),
                            onTap: () {
                              textEditingController.clear();
                            },
                            child: Icon(
                                Icons.clear,
                                size: iconSize,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  optionsViewBuilder: (
                      BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options ){
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: SizedBox(
                          width: 28.h,
                          height: 25.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white12,
                            ),
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index){
                                  final String e = options.elementAt(index);
                                  return GestureDetector(
                                    onTap: (){
                                      onSelected(e);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: ListTile(
                                        title: TextFrame(comment: e),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    );
                  },
                  onSelected: onSelected,
                ),
              );
            },
          );
        });
  }
}