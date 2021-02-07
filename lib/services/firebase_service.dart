import 'package:firebase_auth/firebase_auth.dart';
import 'package:flukey_hackathon/common/auth_exception.dart';
import 'package:flukey_hackathon/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../common/extensions.dart';

import 'authentication_service.dart';

class FirebaseAuthService extends IAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  @override
  Future<UserModel> signIn({String email, String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      //TODO 1: map UserModel with fromJson() from User
      return userCredential.user.toUser();
    } on Exception {
      throw LogInWithEmailFailure();
    }
  }

  @override
  Future<UserModel> signUp(
      {String email,
      String password,
      String firstName,
      String lastName}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      //TODO 2: map UserModel with fromJson() from User
      return userCredential.user
          .toUser(firstName: firstName, lastName: lastName);
    } on Exception {
      throw SignUpFailure();
    }
  }

  @override
  Future<UserModel> singInWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();

      final googleAuth = await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      //TODO 3: map UserModel with fromJson() from User
      return userCredential.user.toUser();
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> logOut({String email, String password}) async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }

  @override
  bool isUserSignedIn() {
    return _firebaseAuth.currentUser == null ? false : true;
  }

  @override
  Future<UserModel> getUser() async {
    return await _firebaseAuth.currentUser.toUser();
  }
}
