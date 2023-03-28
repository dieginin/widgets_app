import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  static const name = 'theme_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () => ref.read(isDarkmodeProvider.notifier).update((state) => !state),
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (_, i) {
        final color = colors[i];

        return RadioListTile(
          value: i,
          groupValue: selectedColor,
          activeColor: color['color'],
          onChanged: (_) => ref.read(selectedColorProvider.notifier).state = i,
          title: Text(
            color['name'],
            style: TextStyle(color: color['color']),
          ),
        );
      },
    );
  }
}
