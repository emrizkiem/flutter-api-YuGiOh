import 'package:flutter/material.dart';
import 'package:osg4_project_final/model/card_info.dart';
import 'package:osg4_project_final/ui/home/item_row_card_info.dart';

class ListViewCardInfo extends StatefulWidget {
  final List<CardInfo> listCardInfo;

  ListViewCardInfo({Key key, this.listCardInfo}) : super(key: key);

  @override
  _ListViewCardInfo createState() {
    return _ListViewCardInfo();
  }
}

class _ListViewCardInfo extends State<ListViewCardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            children: widget.listCardInfo.map((CardInfo cardInfo) {
              return ItemRowCardInfo(cardInfo);
            }).toList(),
          )),
        ],
      ),
    );
  }
}
