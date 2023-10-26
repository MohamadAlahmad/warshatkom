import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title   : ${message.notification?.title}');
  debugPrint('Body    : ${message.notification?.body}');
  debugPrint('Payload : ${message.data}'); //وذلك في حال وجودها لهالـ Payload
}

class FirebaseApi{
final _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initNotifications() async {
  await _firebaseMessaging.requestPermission();

  final fcmToken = await _firebaseMessaging.getToken();
  debugPrint('Token : $fcmToken');
  //TokenController().saveToken(fcmToken!);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

}
