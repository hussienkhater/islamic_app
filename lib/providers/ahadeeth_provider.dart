import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../hadeeth_model.dart';

class ahadeethPro extends ChangeNotifier{
  List<HadeethModel> allAhadeeth =[];
  loadHadeethFile()async{
    await rootBundle.loadString("assets/file/ahadeth.txt").then((value){
      List<String> ahadeeth = value.split("#");
      for(int i=0;i<ahadeeth.length;i++){
        String HadeethOne = ahadeeth[i];
        List<String> HadeethLine= HadeethOne.trim().split("\n");
        String title= HadeethLine[0];
        HadeethLine.removeAt(0);
        List<String> content = HadeethLine;
        HadeethModel hadeethModel=HadeethModel(title, content);
        allAhadeeth.add(hadeethModel);
      }
    });
    notifyListeners();
  }
}