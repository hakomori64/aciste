import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/providers.dart';

import '../custom_exception.dart';

abstract class BaseAuthRepository {
  
  Stream<User?> get authStateChanges;

  Future<void> signInAnonymously();

  Future<User?> signInWithEmailAndPassword({required String email, required String password});
  Future<User?> signUpWithEmailAndPassword({required String email, required String password});

  Future<User?> googleSignIn();

  User? getCurrentUser();

  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));
final _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]
);

class AuthRepository implements BaseAuthRepository {

  final Reader _read;

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthProvider).authStateChanges();

  @override
  Future<User?> signInAnonymously() async {
    try {
      final result = await _read(firebaseAuthProvider).signInAnonymously();
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await _read(firebaseAuthProvider).signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await _read(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      return result.user;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  @override
  Future<User?> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final result = await _read(firebaseAuthProvider).signInWithCredential(credential);
      final user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}