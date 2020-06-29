import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseUser user;

Future<FirebaseUser> signInWithGoogle() async {
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  final authResult = await _auth.signInWithCredential(credential);

  print("signInWithGoogle " + "${authResult.user.displayName}");
  user = authResult.user;
  return authResult.user;
}

void signOut() => _auth.signOut();

FirebaseUser checkUser() => (user.toString() == null ? user : null);

Future registerWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = result.user;
    return firebaseUser;
//  return _userFromFirebaseUser(firebaseUser);
  } catch (e) {
    print(e);
    return null;
  }
}

Future signInWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = result.user;
    user = firebaseUser;
    return firebaseUser;
//  return _userFromFirebaseUser(firebaseUser);
  } catch (e) {
    print(e);
    return null;
  }
}


//User _userFromFirebaseUser(FirebaseUser firebaseUser) {
//  return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
//}
//
//class User {
//  final String uid;
//
//  User({this.uid});
//}
