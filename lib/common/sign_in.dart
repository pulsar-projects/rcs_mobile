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

  return authResult.user;
}

void signOut() => _auth.signOut();

FirebaseUser checkUser() => (user.toString() == null ? user : null);