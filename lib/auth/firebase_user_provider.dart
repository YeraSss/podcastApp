import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GroupProjectFirebaseUser {
  GroupProjectFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GroupProjectFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GroupProjectFirebaseUser> groupProjectFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GroupProjectFirebaseUser>(
      (user) {
        currentUser = GroupProjectFirebaseUser(user);
        return currentUser!;
      },
    );
