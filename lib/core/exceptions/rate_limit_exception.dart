class RateLimitException implements Exception {
  @override
  String toString() => 'You are being rate limited';
}
