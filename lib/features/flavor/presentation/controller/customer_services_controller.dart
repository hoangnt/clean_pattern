import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CustomerServicesController extends BaseController {
  final TextEditingController msgController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final wsUrl = "wss://echo.websocket.org";
  late WebSocketChannel channel;

  final RxList<String> chatData = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();

    channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    await channel.ready;

    channel.stream.listen((message) {
      chatData.add(message);
      chatData.refresh();
    });
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }

  void sendMessage() {
    final msg = msgController.text;
    channel.sink.add(msg);
    msgController.clear();

    Future.delayed(Duration(milliseconds: 1000), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
      );
    });
  }
}
