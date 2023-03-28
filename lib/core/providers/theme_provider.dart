import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// Listado de colores INMUTABLE
final colorListProvider = Provider((ref) => colorList);
