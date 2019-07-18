import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

import 'main_model.dart';
import 'item_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter One Year Challenge',
      home: ChangeNotifierProvider<MainModel>(
        builder: (_) => MainModel(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MainModel>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 150,
              child: Consumer<MainModel>(
                builder: (context, mainModel, _) => mainModel.items == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainModel.items.length,
                        itemBuilder: (context, index) {
                          Color randColor = RandomColor().randomColor(
                              colorBrightness: ColorBrightness.light);
                          return SizedBox(
                            width: 100,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChangeNotifierProvider<Item>(
                                  builder: (_) => mainModel.items[index],
                                  child: Consumer<Item>(
                                    builder: (context, item, _) => ItemCard(
                                      item: item,
                                      color: randColor,
                                      onTap: () => mainModel.showDetailed(
                                          randColor, index),
                                    ),
                                  ),
                                )),
                          );
                        },
                      ),
              ),
            ),
            Divider(),
            Center(
              child: Consumer<MainModel>(
                builder: (context, mainModel, _) =>
                    mainModel.detailedIndex == null
                        ? Container()
                        : SizedBox(
                            width: 200,
                            height: 200,
                            child: ItemCard(
                              item: mainModel.items[mainModel.detailedIndex],
                              color: mainModel.detailedColor,
                              onTap: () => mainModel.increment(),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  final Color color;
  final Function onTap;

  ItemCard({this.item, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        child: Center(
          child: Text(item.count.toString()),
        ),
      ),
    );
  }
}
