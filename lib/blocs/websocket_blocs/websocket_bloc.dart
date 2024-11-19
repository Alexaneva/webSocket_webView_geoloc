import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_webview_geoloc/blocs/websocket_blocs/websocket_event.dart';
import 'package:websocket_webview_geoloc/blocs/websocket_blocs/websocket_state.dart';

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  final WebSocketChannel channel;

  WebSocketBloc(this.channel) : super(WebSocketInitial()) {
    on<ConnectWebSocket>((event, emit) async {
      emit(WebSocketConnected());
      channel.stream.listen((message) {
        add(MessageReceived(message));
      });
    });

    on<DisconnectWebSocket>((event, emit) {
      emit(WebSocketDisconnected());
      channel.sink.close();
    });

    on<SendMessage>((event, emit) {
      channel.sink.add(event.message);
    });

    on<MessageReceived>((event, emit) {
      emit(WebSocketMessageReceived(event.message));
    });
  }
}
