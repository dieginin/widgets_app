import 'package:flutter/material.dart';

import '/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (_, i) {
        final MenuItem appMenuItem = appMenuItems[i];

        return _CustomListTile(
          appMenuItem: appMenuItem,
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.appMenuItem,
  });

  final MenuItem appMenuItem;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        appMenuItem.icon,
        color: colors.primary,
      ),
      title: Text(
        appMenuItem.title,
        style: TextStyle(color: colors.primary),
      ),
      subtitle: Text(
        appMenuItem.subTitle,
        style: TextStyle(color: colors.secondary),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      onTap: () {
        // TODO navegar a otras pantallas
      },
    );
  }
}
