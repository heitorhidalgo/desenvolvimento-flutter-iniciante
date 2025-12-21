sealed class MessagesStates {}

class IdleMessage extends MessagesStates {}

class SuccessMessage extends MessagesStates {
  final String message;

  SuccessMessage({required this.message});
}

class ErrorMessage extends MessagesStates {
  final String message;

  ErrorMessage({required this.message});
}