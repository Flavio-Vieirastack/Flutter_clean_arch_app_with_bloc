class ListFetchExceptions implements Exception {
  final String? message;
  
  ListFetchExceptions({
    this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListFetchExceptions &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
