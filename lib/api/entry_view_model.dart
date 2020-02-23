import 'package:wu_han_fighting_flutter/api/entry_request_model.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

EntryViewModel entryViewModel = EntryViewModel();

class EntryViewModel extends ViewModel {
  Future getEntryData () async {
    try {
      var data = await EntryRequestModel().data();

      if(data is List) {
        List list = List();
        data.forEach((json) => list.add(EntryModel.fromJson(json)));

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