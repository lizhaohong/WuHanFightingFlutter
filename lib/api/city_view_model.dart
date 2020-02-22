import 'package:wu_han_fighting_flutter/api/city_request_model.dart';
import 'package:wu_han_fighting_flutter/common/common.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

CityViewModel cityViewModel = CityViewModel();

class CityViewModel extends ViewModel {
  Future getProvinceData() async {
    try {
      var data = await CityRequestModel().get();

      if(data is List) {
        if(listNoEmpty(data)) {
          List list = List();

          data.forEach((map) => list.add(ProvinceModel.fromJson(map)));

          return Future.value(list);
        } else {
          return Future.value(List());
        }
      } else {
        return Future.value(List());
      }
    } catch (e) {
      print("error = ${e.toString()}");

      return Future.value(List());
    }
  }
}