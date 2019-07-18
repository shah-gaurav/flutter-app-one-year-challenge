import 'package:flutter/foundation.dart';

class Item extends ChangeNotifier {
  int _count = 0;

  get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}

class ItemProvider {
  Future<List<Item>> fetchItems() async {
    var returnList = List<Item>();
    await Future.delayed(Duration(seconds: 2), () {
      for (int i = 0; i < 5; i++) {
        returnList.add(Item());
      }
    });
    return returnList;
  }
}
