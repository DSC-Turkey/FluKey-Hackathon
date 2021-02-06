import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication_service.dart';

class FirebaseAuthService extends IAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthService(this._firebaseAuth, this._googleSignIn);

  @override
  Future<void> signIn({String email, String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<UserCredential> singInWithGoogle(
      {String email, String password}) async {
    var googleSignInAccount = await _googleSignIn.signIn();

    var googleAuth = await googleSignInAccount.authentication;

    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> singOut({String email, String password}) async {
    await _firebaseAuth.signOut();
  }

  @override
  bool isUserSignedIn() {
    return _firebaseAuth.currentUser == null ? false : true;
  }
}
