import 'package:wu_han_fighting_flutter/api/knowledge_request_model.dart';
import 'package:wu_han_fighting_flutter/http/view_model.dart';

KnowledgeViewModel knowledgeViewModel = KnowledgeViewModel();

class KnowledgeViewModel extends ViewModel {
  Future getKnowledge() async {
    try {
      var data = await KnowledgeRequestModel().data();

      List result = data['result'];

      List list = List();

      result.forEach((json)=>list.add(KnowledgeModel.fromJson(json)));

      return Future.value(list);
    } catch(e) {
      print("error = ${e.toString()}");

      return Future.value(List());
    }
  }
}