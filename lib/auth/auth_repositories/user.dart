import 'package:equatable/equatable.dart';

class User extends Equatable{

  const User({
  required this.id,
    this.name,
    this.email,
    this.password,
});
  final int id;
  final String? email;
  final String? password;
  final String? name;

  static const empty = User(id: -1);

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  factory User.fromMap(Map<dynamic,dynamic> map){
    return User(
      id:map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [id,name,email,password];
}