import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

class UserModel extends User with EquatableMixin {
  UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.avatar,
  });

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}
