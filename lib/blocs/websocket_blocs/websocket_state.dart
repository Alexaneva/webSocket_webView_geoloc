abstract class WebSocketState {}

class WebSocketInitial extends WebSocketState {}

class WebSocketConnected extends WebSocketState {}

class WebSocketDisconnected extends WebSocketState {}

class WebSocketMessageReceived extends WebSocketState {
  final String message;

  WebSocketMessageReceived(this.message);
}
