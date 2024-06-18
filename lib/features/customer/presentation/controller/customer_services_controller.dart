import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/customer/data/model/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CustomerServicesController extends BaseController {
  final TextEditingController msgController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final wsUrl = "wss://echo.websocket.org";
  late WebSocketChannel channel;

  final RxList<ChatMessageModel> chatData = <ChatMessageModel>[].obs;

  @override
  void onInit() async {
    super.onInit();

    channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    await channel.ready;

    channel.stream.listen((message) {
      final chatMessage = ChatMessageModel.fromJson({
        "isOwner": false,
        "text": message,
        "sentAt": DateTime.now().millisecondsSinceEpoch
      });

      chatData.add(chatMessage);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    });
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }

  void sendMessage() {
    final msg = ChatMessageModel(
      text: msgController.text.trim(),
      sentAt: DateTime.now(),
    );
    chatData.add(msg);
    channel.sink.add(msgController.text.trim());
    msgController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
      );
    });
  }
}
