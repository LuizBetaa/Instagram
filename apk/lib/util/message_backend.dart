import 'message_model.dart';

class MessageBackend {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
  }

  void replyToMessage(Message message) {
    // Simple logic for bot's reply
    String replyText = 'hai';
    Message botReply = Message(sender: 'HumanFive', text: replyText, isMe: false);
    _messages.add(botReply);
  }
}//membuat logika pada bot 
