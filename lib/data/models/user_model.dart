import 'package:equatable/equatable.dart';
import 'package:kost_z/domain/entities/user.dart';

class UsersModel extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? address;

  UsersModel({
    required this.id,
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

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] != null ? map['id'] : null,
      email: map['email'] != null ? map['email'] : null,
      name: map['name'] != null ? map['name'] : null,
      address: map['address'] != null ? map['address'] : null,
    );
  }

  Users toEntity() => Users(
        id: id,
        email: email,
        name: name,
        address: address,
      );

  @override
  List<Object?> get props => [id, email, name, address];
}
