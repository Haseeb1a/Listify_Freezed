import 'package:flutter/material.dart';
import 'package:todofreezed/models/tudo_model.dart';
import '../services/todo_connections.dart';

class Homedata extends ChangeNotifier {
  Future<Todo>? data;

  Future<void> refreshData() async {
    data = ApiService.fetchDataFromAPI();
    await data; // Wait for the data to be fetched
    notifyListeners();
  }

  // You should await the data fetch in the constructor as well
  Homedata() {
    refreshData();
    notifyListeners();
  }

  deleteitems(BuildContext context, itemid) {
    print(itemid!);
    ApiService().deleteItem(context, itemid!);
    refreshData();
    // data;
    notifyListeners();
  }
}
