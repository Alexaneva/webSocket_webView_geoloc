abstract class WebSocketEvent {}

class ConnectWebSocket extends WebSocketEvent {}

class DisconnectWebSocket extends WebSocketEvent {}

class SendMessage extends WebSocketEvent {
  final String message;

  SendMessage(this.message);
}

class MessageReceived extends WebSocketEvent {
  final String message;

  MessageReceived(this.message);
}
