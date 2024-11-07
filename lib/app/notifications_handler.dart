import 'package:event_bus/event_bus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/constants.dart';

// Create an instance of EventBus for event handling
EventBus eventBus = EventBus();

class NotificationsHandler {
  late FirebaseMessaging _messaging;

  init() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _setForegroundNotificationPresentationOptions();

    await _requestPermission();

    _onMessageReceived();

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage, true);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      _handleMessage(remoteMessage, true);
    });

    print("getFcmToken---> \n ${await getFcmToken()}");
  }

  // Handle incoming push notifications
  void _handleMessage(RemoteMessage? message, [bool isMsgOpened = false]) {
    print('Handling a _handleMessage');
    // if (message != null && message.data['category'] == 'newTask') {
    if (message != null) {
      print("notification is $message");
      eventBus.fire(PushNotificationEvent(NotificationMessage(
        data: message.data,
        isOpenedFromNotifications: isMsgOpened,
        body: message.notification?.body,
      )));
    }
  }

  // Set foreground notification presentation options
  Future<void> _setForegroundNotificationPresentationOptions() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // Request notification permission from the user
  _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: Handle the received notifications
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // Handle messages received while the app is in the foreground
  _onMessageReceived() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data iz : ${message.data}');
      eventBus.fire(PushNotificationEvent(NotificationMessage(
        data: message.data,
        body: message.notification?.body,
        isOpenedFromNotifications: false,
      )));

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  // Get the FCM token
  Future<String?> getFcmToken() async {
    Constants.fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    return Constants.fcmToken;
  }

  // Listen for token refresh events
  _onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      Constants.fcmToken = fcmToken;
      print("fcmToken---> $fcmToken");
      // Handle token refresh, e.g., send the token to your server
      eventBus.fire(UpdateFcmTokenEvent(fcmToken));
    }).onError((err) {
      // Handle errors while refreshing the token
    });
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  // Handle background messages here
  // You can add custom logic for processing these messages
}

// Custom event class to represent FCM token update
class UpdateFcmTokenEvent {
  String token;

  UpdateFcmTokenEvent(this.token);
}

// Custom event class to represent push notifications
class PushNotificationEvent {
  NotificationMessage notificationMessage;

  PushNotificationEvent(this.notificationMessage);
}

// Custom class to represent notification messages
class NotificationMessage {
  NotificationMessage({
    required this.data,
    this.body,
    this.isOpenedFromNotifications = false,
  });

  Map<String, dynamic> data;
  String? body;
  bool isOpenedFromNotifications;
}

// Provider for NotificationsHandler
final notificationsHandlerProvider = Provider<NotificationsHandler>((ref) {
  return NotificationsHandler()..init();
});
