import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hobby = '',
  });

  @override
  List<Object?> get props => [id, email, name, hobby];
}
