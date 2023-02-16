class AuthRepository{
  Future<void> signIn() async{
    print("attempting sign in");
    await Future.delayed(const Duration(seconds: 3));
    print('sign in');
  }
}