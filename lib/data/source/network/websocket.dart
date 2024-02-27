import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

abstract class Websocket {
  Stream<String> get onMessage;

  Stream<void> get onConnected;

  Stream<dynamic> get onDisconnected;


  void connect();

  void disconnect();

  void reconnect();

  void send(String message);
}

class WebsocketImpl implements Websocket {
  WebSocketChannel? _channel;

  final StreamController<String> _onMessageController =
      StreamController.broadcast();
  final StreamController<void> _onConnectedController =
      StreamController.broadcast();
  final StreamController<dynamic> _onDisconnectedController =
      StreamController.broadcast();


  @override
  Stream<dynamic> get onDisconnected => _onDisconnectedController.stream;

  @override
  Stream<void> get onConnected => _onConnectedController.stream;

  @override
  Stream<String> get onMessage => _onMessageController.stream;

  @override
  void connect() {
    _channel = WebSocketChannel.connect(
      // Uri.parse('ws://192.168.2.135:8888'),
      Uri.parse('ws://124.222.224.186:8800'),
    );

    _channel?.stream.listen(
      (event) {
        _onMessageController.add(event);
      },
      onError: (error) {
        _onDisconnectedController.add(error);
      },
      onDone: () {
        _onDisconnectedController.add(null);
      },
      cancelOnError: true,
    );

    _onConnectedController.add(null);
  }


  @override
  void send(String message) {
    _channel?.sink.add(message);
  }

  @override
  void disconnect() {
    _channel?.sink.close();
  }

  @override
  void reconnect() {
    disconnect();
    connect();
  }
}
