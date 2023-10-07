class Message {
  final String sender;
  final String text;
  final bool isMe; // // Menunjukkan jika pesan dikirim oleh pengguna

  Message({required this.sender, required this.text, required this.isMe});
}
