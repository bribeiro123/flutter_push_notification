import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/provider/firebase_push_notification.dart';
import 'package:flutter_push_notification/services/send-messaging-firebase.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PushNotificationsManager _pushNotificationManager = new PushNotificationsManager();
  @override
  void initState() {
    _pushNotificationManager.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Text("Nenhuma Notificação"),
            new RaisedButton(
                child: new Text("Enviar Mensagem"),
                onPressed: () {
                  String token = _pushNotificationManager.authToken;
                  String data =
                      "{\"notification\": {\"body\": \"Texto da notificação\",\"title\": \"Título\"}, \"priority\": \"high\", \"data\": {\"click_action\": \"FLUTTER_NOTIFICATION_CLICK\", \"id\": \"1\", \"status\": \"done\"}, \"to\": \"$token\"}";
                  SendMessaging sendMessage = SendMessaging();
                  sendMessage.sendMessage(token, data);
                }),
          ],
        ),
      ),
    );
  }
}
