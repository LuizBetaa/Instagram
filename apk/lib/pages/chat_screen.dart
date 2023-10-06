import 'package:apk/util/message_backend.dart';
import 'package:apk/util/message_model.dart';
import 'package:flutter/material.dart';

class UserChat extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<UserChat> {
  MessageBackend _messageBackend = MessageBackend();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messageBackend.messages.length,
              itemBuilder: (context, index) {
                Message message = _messageBackend.messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    Color messageColor = message.isMe ? Colors.blue : Colors.green;
    CrossAxisAlignment crossAxisAlignment =
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: messageColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            Text(
              '${message.sender}: ${message.text}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                Message userMessage = Message(
                  sender: 'You',
                  text: _textController.text,
                  isMe: true,
                );
                _messageBackend.addMessage(userMessage);

                // Reply from the bot
                _messageBackend.replyToMessage(userMessage);

                setState(() {
                  _textController.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
