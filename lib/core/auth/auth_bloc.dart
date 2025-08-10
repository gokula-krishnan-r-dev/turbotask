import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/entities/user.dart';
import 'auth_manager.dart';
import 'auth_state.dart';
import 'auth_state_event.dart';

/// Global authentication BLoC for managing app-wide auth state
@singleton
class AuthBloc extends Bloc<AuthStateEvent, AuthState> {
  AuthBloc(this._authManager) : super(const AuthState.initial()) {
    on<AuthStateEvent>((event, emit) async {
      await event.when(
        authStateChanged: (isAuthenticated, user) =>
            _onAuthStateChanged(isAuthenticated, user, emit),
        userUpdated: (user) => _onUserUpdated(user, emit),
        logout: () => _onLogout(emit),
      );
    });

    // Listen to auth manager streams
    _authStateSubscription = _authManager.authStateStream.listen((
      isAuthenticated,
    ) {
      print('🔥 AuthBloc: Received auth state change: $isAuthenticated');
      if (isAuthenticated) {
        final user = _authManager.currentUser;
        if (user != null) {
          print(
            '🔥 AuthBloc: Adding authenticated state event for user: ${user.email}',
          );
          add(
            AuthStateEvent.authStateChanged(isAuthenticated: true, user: user),
          );
        }
      } else {
        print('🔥 AuthBloc: Adding unauthenticated state event');
        add(const AuthStateEvent.authStateChanged(isAuthenticated: false));
      }
    });

    _userSubscription = _authManager.userStream.listen((user) {
      if (user != null) {
        add(AuthStateEvent.userUpdated(user: user));
      }
    });

    // Initialize with current state
    _initializeCurrentState();
  }

  final AuthManager _authManager;
  StreamSubscription<bool>? _authStateSubscription;
  StreamSubscription<User?>? _userSubscription;

  /// Initialize BLoC with current auth state
  void _initializeCurrentState() {
    // Use a small delay to ensure AuthManager is fully initialized
    Future.microtask(() {
      if (_authManager.isAuthenticated && _authManager.currentUser != null) {
        add(
          AuthStateEvent.authStateChanged(
            isAuthenticated: true,
            user: _authManager.currentUser!,
          ),
        );
      } else {
        add(const AuthStateEvent.authStateChanged(isAuthenticated: false));
      }
    });
  }

  /// Handle authentication state changes
  Future<void> _onAuthStateChanged(
    bool isAuthenticated,
    User? user,
    Emitter<AuthState> emit,
  ) async {
    print(
      '🔥 AuthBloc: _onAuthStateChanged called - isAuthenticated: $isAuthenticated, user: ${user?.email}',
    );

    if (isAuthenticated && user != null) {
      print('🔥 AuthBloc: Emitting authenticated state');
      emit(AuthState.authenticated(user: user));
    } else {
      print('🔥 AuthBloc: Emitting unauthenticated state');
      emit(const AuthState.unauthenticated());
    }
  }

  /// Handle user data updates
  Future<void> _onUserUpdated(User user, Emitter<AuthState> emit) async {
    // Only update if currently authenticated
    if (state.isAuthenticated) {
      emit(AuthState.authenticated(user: user));
    }
  }

  /// Handle logout
  Future<void> _onLogout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      await _authManager.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      // Even if logout fails, clear the local state
      emit(const AuthState.unauthenticated());
    }
  }

  /// Logout the current user
  void logout() {
    add(const AuthStateEvent.logout());
  }

  /// Update current user data
  void updateUser(User user) {
    add(AuthStateEvent.userUpdated(user: user));
  }

  /// Check if user is authenticated
  bool get isAuthenticated => state.isAuthenticated;

  /// Get current user
  User? get currentUser => state.user;

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
