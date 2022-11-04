part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.id,
    this.user = User.empty,
  });

  const AppState.authenticated(User user, String id)
      : this._(status: AppStatus.authenticated, user: user, id: id);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;
  final String? id;

  @override
  List<Object> get props => [status, user];
}
