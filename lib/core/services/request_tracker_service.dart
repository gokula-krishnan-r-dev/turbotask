/// Service to track and prevent duplicate API requests globally across the app
class RequestTrackerService {
  static final RequestTrackerService _instance =
      RequestTrackerService._internal();
  factory RequestTrackerService() => _instance;
  RequestTrackerService._internal();

  final Map<String, DateTime> _activeRequests = {};
  final Duration _requestTimeout = const Duration(seconds: 30);

  /// Check if a request is already in progress and add it if not
  bool tryAddRequest(String requestKey) {
    final now = DateTime.now();

    // Clean up expired requests
    _cleanupExpiredRequests(now);

    // Check if request is already active
    if (_activeRequests.containsKey(requestKey)) {
      print('RequestTracker: Duplicate request blocked for key: $requestKey');
      return false;
    }

    // Add new request
    _activeRequests[requestKey] = now;
    print('RequestTracker: Request added for key: $requestKey');
    return true;
  }

  /// Remove a request when it completes
  void removeRequest(String requestKey) {
    _activeRequests.remove(requestKey);
    print('RequestTracker: Request removed for key: $requestKey');
  }

  /// Generate a unique request key for break start requests
  String generateBreakStartKey({
    required String todoId,
    required String projectId,
    required String breakType,
  }) {
    return 'break_start_${todoId}_${projectId}_$breakType';
  }

  /// Clean up expired requests to prevent memory leaks
  void _cleanupExpiredRequests(DateTime now) {
    final expiredKeys = <String>[];

    _activeRequests.forEach((key, timestamp) {
      if (now.difference(timestamp) > _requestTimeout) {
        expiredKeys.add(key);
      }
    });

    for (final key in expiredKeys) {
      _activeRequests.remove(key);
      print('RequestTracker: Expired request cleaned up for key: $key');
    }
  }

  /// Get the count of active requests (for debugging)
  int get activeRequestCount => _activeRequests.length;

  /// Clear all active requests (for testing or reset)
  void clearAll() {
    _activeRequests.clear();
    print('RequestTracker: All requests cleared');
  }
}
