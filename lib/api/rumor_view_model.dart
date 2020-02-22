import 'package:wu_han_fighting_flutter/api/rumor_request_model.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

RumorViewModel rumorViewModel = RumorViewModel();

class RumorViewModel extends ViewModel {
  Future getRumorData() async {
    try {
      var data = await RumorRequestModel().data();

      if(data is List) {
        List list = List();

        data.forEach((json) => list.add(RumorModel.fromJson(json)));

        return Future.value(list);
      } else {
        return Future.value(List());
      }
    } catch(e) {
      print("error = ${e.toString()}");

      return Future.value(List());
    }
  }
}