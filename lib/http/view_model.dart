class ViewModel {
  List dataListToModel(List <dynamic> data, model) {
    List list = List();

    data.forEach((json) => list.add(model.fromJson(json)));

    return list;
  }
}
