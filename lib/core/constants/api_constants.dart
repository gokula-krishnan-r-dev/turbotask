class ApiConstants {
  // Base URL for the API
  static const String baseUrl = 'http://localhost:8080';

  // API endpoints
  static const String loginEndpoint = '/api/v1/auth/login';
  static const String registerEndpoint = '/api/v1/auth/register';
  static const String refreshTokenEndpoint = '/api/v1/auth/refresh';

  // AI endpoints
  static const String aiTasksEndpoint = '/api/v1/ai/tasks';
  static const String aiSubtasksRefineEndpoint = '/api/v1/ai/subtasks/refine';
  static const String aiDescriptionImproveEndpoint =
      '/api/v1/ai/description/improve';
  static const String aiSuggestionsAcceptEndpoint =
      '/api/v1/ai/suggestions/accept';
  static const String aiSuggestionsRejectEndpoint =
      '/api/v1/ai/suggestions/reject';
  static const String aiMetricsEndpoint = '/api/v1/ai/metrics';

  // Project endpoints
  static const String projectsEndpoint = '/api/v1/todo/projects';
  static const String tasksEndpoint = '/api/v1/todo/tasks';
  static const String subtasksEndpoint = '/api/v1/todo/subtasks';

  // HTTP headers
  static const String contentTypeHeader = 'Content-Type';
  static const String authorizationHeader = 'Authorization';
  static const String applicationJson = 'application/json';

  // Response codes
  static const int successCode = 200;
  static const int createdCode = 201;
  static const int unauthorizedCode = 401;
  static const int forbiddenCode = 403;
  static const int notFoundCode = 404;
  static const int serverErrorCode = 500;
}
