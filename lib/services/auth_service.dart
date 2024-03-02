import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> handleLogin(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return "Verifique seu email e senha e tente novamente.";
        case 'invalid-credential':
          return "Verifique seu email e senha e tente novamente.";
      }
      return e.code;
    }
    return null;
  }

  Future<String?> handleRegisterUser({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(username);
      print("Funcionou chegamos nessa linha!");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-exists':
          return "O e-mail já está em uso.";
      }
      return e.code;
    }
    return null;
  }

  Future<String?> handleForgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return "Digite um email válido";
        case 'channel-error':
          return 'Campo vazio!';
      }
      return e.code;
    }
    return null;
  }
}
