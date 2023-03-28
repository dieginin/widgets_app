import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// Listado de colores INMUTABLE
final colorListProvider = Provider((ref) => colorList);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier del tema
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  toggleDarkmode() => state = state.copyWith(isDarkmode: !state.isDarkmode);

  changeColorIndex(int colorIndex) => state = state.copyWith(selectedColor: colorIndex);
}
