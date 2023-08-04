/// Holds information regarding the rate limit for authentication attempts.
class AuthRateLimit {
  /// Constructs an instance of [AuthRateLimit].
  AuthRateLimit({
    this.attempts = 0,
    this.lastTimeLimitWasHit,
  });

  /// How many attempts have been made.
  int attempts;

  /// The last time the limit was hit.
  DateTime? lastTimeLimitWasHit;

  /// Increments the number of attempts.
  void increment() {
    attempts++;
  }
}
