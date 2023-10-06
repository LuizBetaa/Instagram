class Message {
  final String sender;
  final String text;
  final bool isMe; // Indicates if the message is sent by the user

  Message({required this.sender, required this.text, required this.isMe});
}
