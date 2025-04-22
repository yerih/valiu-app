


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMsgBackgroundHandler(RemoteMessage msg) async {
  await NotificationManager.instance.setupFlutterNotification();
  await NotificationManager.instance.showNotification(msg);

}


class NotificationManager {
  NotificationManager._();
  static final NotificationManager instance = NotificationManager._();
  get flutterLocalNotificationsPlugin => FlutterLocalNotificationsPlugin();

  final _messaging = FirebaseMessaging.instance;
  final _localNotification = FlutterLocalNotificationsPlugin();
  var _isInit = false;

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMsgBackgroundHandler);
    await _requestNotification();
    await _setupMsgHandlers();
  }

  Future<void> _requestNotification() async{
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
    debugPrint('nm authorization status: ${settings.authorizationStatus}');
  }

  Future<void> setupFlutterNotification() async{
    if(_isInit) return;
    const channel = AndroidNotificationChannel(
        'high_importance',
        'High Importance Notification',
      description: 'Channel used for important notification',
      importance: Importance.max
    );

    await _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const initializingAndroidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final darwinSettings = DarwinInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: initializingAndroidSettings,
        iOS: darwinSettings
    );
    await _localNotification.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse){
          debugPrint('onDidReceiveNotificationResponse: ${notificationResponse.payload}');
        }
    );
    _isInit = true;
  }

  Future<void> showNotification(RemoteMessage msg) async {
    RemoteNotification? n = msg.notification;
    AndroidNotification? an = msg.notification?.android;
    if(n != null && an != null){
      await _localNotification.show(
        n.hashCode,
        n.title,
        n.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notification',
            channelDescription: 'Channel used for important notification',
            importance: Importance.max,
            priority: Priority.max,
            icon: '@mipmap/ic_launcher'
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true
          )
        )
      );
    }
  }

  Future<void> _setupMsgHandlers() async{
    FirebaseMessaging.onMessage.listen((msg){showNotification(msg);});
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMsg);
    final initMsg = await _messaging.getInitialMessage();
    if(initMsg != null) _handleBackgroundMsg(initMsg);

  }



  void _handleBackgroundMsg(RemoteMessage event) {
    debugPrint('Handling a background message: ${event.messageId}');

  }
}




