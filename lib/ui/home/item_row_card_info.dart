import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:osg4_project_final/model/card_info.dart';
import 'package:osg4_project_final/ui/detail/detail.dart';
import 'package:toast/toast.dart';

class ItemRowCardInfo extends StatefulWidget {
  final CardInfo cardInfo;

  ItemRowCardInfo(CardInfo cardInfo)
      : cardInfo = cardInfo,
        super(key: ObjectKey(cardInfo));

  @override
  _ItemRowCardInfoState createState() {
    return _ItemRowCardInfoState(cardInfo);
  }
}

class _ItemRowCardInfoState extends State<ItemRowCardInfo> {
  final CardInfo _cardInfo;

  _ItemRowCardInfoState(this._cardInfo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showToast(_cardInfo.name,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(cardInfo: _cardInfo)),
          );
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Container(
                          width: 120,
                          height: 150,
                          child: CachedNetworkImage(
                            imageUrl: _cardInfo.cardImages[0].imageUrl,
                            placeholder: (context, url) => SizedBox(
                                height: 15,
                                width: 15,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                )),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            _cardInfo.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                _cardInfo.desc,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,),
                              )),
                          Text(
                            _cardInfo.type,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18,
                              ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )),
                  ],
                ))));
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
