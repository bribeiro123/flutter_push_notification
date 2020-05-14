// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationProvider {
//   String data = "Nenhuma Notificação";
//   FirebaseMessaging firebaseMessaging;
//   String token;

//   void setUpFirebaseCloudMessaging() {
//     firebaseMessaging = new FirebaseMessaging();
//     firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//       print("onMessage: " + '$message');
//       data = message.toString();
//     }, onResume: (Map<String, dynamic> message) async {
//       print("onMessage: " + '$message');
//       data = message.toString();
//     }, onLaunch: (Map<String, dynamic> message) async {
//       print("onMessage: " + '$message');
//       data = message.toString();
//     });
//     firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(sound: true, badge: true, alert: true));
//     firebaseMessaging.getToken().then((response) {
//       print(response);
//       token = response;
//     });
//   }

// }
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;
  String authToken;
  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
        },
        onBackgroundMessage: myBackgroundMessageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
        },
      );

      // For testing purposes print the Firebase Messaging token
      authToken = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $authToken");

      _initialized = true;
    }
  }

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }
}
