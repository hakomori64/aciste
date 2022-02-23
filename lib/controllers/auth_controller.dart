import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/repositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref.read));

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
      .authStateChanges
      .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  Future<void> signInAnonymously() async {
    await _read(authRepositoryProvider).signInAnonymously();
  }

  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    return _read(authRepositoryProvider).signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    return _read(authRepositoryProvider).signUpWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    return _read(authRepositoryProvider).sendPasswordResetEmail(email: email);
  }

  Future<void> googleSignIn() async {
    await _read(authRepositoryProvider).googleSignIn();
  }

  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }
}
