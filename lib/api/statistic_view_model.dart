import 'package:wu_han_fighting_flutter/api/statistic_request_model.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

StatisticViewModel statisticViewModel = StatisticViewModel();

class StatisticViewModel extends ViewModel {
  Future getStatisticData() async {
    try {
      var data = await StatisticRequestModel().data();

      return Future.value(StatisticModel.fromJson(data));
    } catch (e) {
      print("error = ${e.toString()}");

      return null;
    }
  }
}