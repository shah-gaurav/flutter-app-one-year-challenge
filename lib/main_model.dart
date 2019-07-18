import 'package:flutter/material.dart';

import 'item_provider.dart';

class MainModel extends ChangeNotifier {
  final itemProvider = ItemProvider();

  List<Item> items;
  Color detailedColor; // The color of the tapped card from the ListView
  int detailedIndex; // The index of the tapped card from the ListView

  getItems() async {
    items = await itemProvider.fetchItems();

    notifyListeners();
  }

  showDetailed(Color color, int index) {
    detailedColor = color;
    detailedIndex = index;

    notifyListeners();
  }

  increment() {
    items[detailedIndex].incrementCount();
  }
}
