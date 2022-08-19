import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part '../adapters/user.g.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
 @HiveType(typeId: 1)
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  @HiveField(0)
  final String? email;

  /// The current user's id.
  @HiveField(1)
  final String id;

  /// The current user's name (display name).
  @HiveField(2)
  final String? name;

  /// Url for the current user's photo.
  @HiveField(3)
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
