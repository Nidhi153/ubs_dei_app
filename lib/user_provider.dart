import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  static final UserProvider _instance = UserProvider._internal();

  factory UserProvider() {
    return _instance;
  }

  UserProvider._internal();

  late User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> initialize() async {
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  String get userId => _currentUser?.uid ?? '';
}