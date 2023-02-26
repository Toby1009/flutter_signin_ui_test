class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;

  UserModel({this.id, this.name, this.email, this.password});

  factory UserModel.fromMap(Map<dynamic,dynamic> map){
    return UserModel(
      id:map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'password':password,
    };
  }
}
