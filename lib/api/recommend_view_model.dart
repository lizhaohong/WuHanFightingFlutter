import 'package:wu_han_fighting_flutter/api/recommend_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';

RecommendViewModel recommendViewModel = RecommendViewModel();

class RecommendViewModel {
  Future getRecommendList() async {
    try {
      var data = await RecommendRequestModel().data();

      List list = List();

      if(data is List) {
        if(listNoEmpty(data)) {
          data.forEach((map) => list.add(RecommendModel.fromJson(map)));

          return Future.value(list);
        } else {
          return Future.value(List());
        }
      } else {
        return Future.value(List());
      }
    } catch(e) {
      print("error = ${e.toString()}");

      return Future.value(List());
    }
  }
}