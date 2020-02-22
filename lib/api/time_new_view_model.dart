import 'package:wu_han_fighting_flutter/api/time_new_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

TimeNewViewModel timeNewViewModel = TimeNewViewModel();

class TimeNewViewModel extends ViewModel {
  Future getTimeNews() async {
    var data = await TimeNewRequestModel().data();

    List list = List();

    if(data is List) {
      if (listNoEmpty(data)) {
        data.forEach((json) => list.add(TimeNewModel.fromJson(json)));

        return Future.value(list);
      }  else {
        return Future.value(List());
      }
    } else {
      return Future.value(List());
    }
  }
}