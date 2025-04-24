import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class PsncamboyaAuthUser {
  PsncamboyaAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<PsncamboyaAuthUser> psncamboyaAuthUserSubject =
    BehaviorSubject.seeded(PsncamboyaAuthUser(loggedIn: false));
Stream<PsncamboyaAuthUser> psncamboyaAuthUserStream() =>
    psncamboyaAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
