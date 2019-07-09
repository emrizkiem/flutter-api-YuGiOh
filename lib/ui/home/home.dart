import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osg4_project_final/model/card_info.dart';
import 'package:osg4_project_final/network/service_network.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'list_card_info.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceNetwork serviceNetwork = ServiceNetwork();
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("EUDEKA-OSG4"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () => _onAlertButtonsPressed(context))
            ],
          ),
          body: FutureBuilder<List<CardInfo>>(
            future: serviceNetwork.loadData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListViewCardInfo(listCardInfo: snapshot.data);
            },
          ),
        ),
        onWillPop: () => _onAlertButtonsPressed(context));
  }

  // Alert with multiple and custom buttons
  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "PERINGATAN",
      desc: "Apakah anda yakin ingin keluar dari aplikasi?",
      buttons: [
        DialogButton(
          child: Text(
            "TIDAK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Color.fromRGBO(25, 27, 238, 1),
        ),
        DialogButton(
          child: Text(
            "IYA",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () =>
              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          color: Color.fromRGBO(238, 27, 27, 1),
        )
      ],
    ).show();
  }
}
