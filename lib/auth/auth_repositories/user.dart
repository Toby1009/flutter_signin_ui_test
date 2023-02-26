class User {

  const User({
  required this.id,
    this.name,
    this.email,
    this.password,
});
  final String id;
  final String? email;
  final String? password;
  final String? name;
}