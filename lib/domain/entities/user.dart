import 'package:equatable/equatable.dart';
import 'package:kost_z/data/models/user_model.dart';

class Users extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? address;

  Users({
    this.id,
    required this.email,
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'] != null ? map['id'] : null,
      email: map['email'] != null ? map['email'] : null,
      name: map['name'] != null ? map['name'] : null,
      address: map['address'] != null ? map['address'] : null,
    );
  }

  UsersModel toModel() => UsersModel(
        id: id,
        email: email,
        name: name,
        address: address,
      );

  @override
  List<Object?> get props => [id, email, name, address];
}
