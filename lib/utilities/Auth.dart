class Auth {
  bool isAuthenticated = false;

  static Auth _instance;

  factory Auth() => _instance;

  Auth._init();

  static Future<void> create() async {
    _instance = Auth._init();
  }
}
