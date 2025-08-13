class ChatStep {
  final String message;
  final List<String> options;
  final bool isFinal;


  ChatStep({
    required this.message,
    this.options = const [],
    this.isFinal = false,

  });
}