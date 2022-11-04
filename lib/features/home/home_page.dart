import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivity/core/authentication/bloc/app_bloc.dart';
import 'package:productivity/features/home/components/profile_widget.dart';
import 'package:productivity/models/user.dart';

import 'components/task_type_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final String? id = context.select((AppBloc bloc) => bloc.state.id);
    print("The Id ===================$id");
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => null, label: const Text("Add new task ")),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Column(
          children: [
            _profileHeader(user, theme, context),
            _tasksMain(user, theme, context, id!),
          ],
        ),
      ),
    );
  }

  _profileHeader(User user, ThemeData theme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileWidget(
          user: user,
        ),
        IconButton(
          key: const Key('homePage_logout_iconButton'),
          icon: Icon(
            Icons.exit_to_app,
            color: theme.shadowColor,
          ),
          onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
        )
      ],
    );
  }

  Widget _tasksMain(
      User user, ThemeData theme, BuildContext context, String id) {
    return Column(
      children: const [
        ClassTypeTile(
          title:"All tasks",
        ),
        ClassTypeTile(
          title: "Today's tasks",
        ),
        ClassTypeTile(
          title: "Upcoming task",
        ),
      ],
    );
  }
}
