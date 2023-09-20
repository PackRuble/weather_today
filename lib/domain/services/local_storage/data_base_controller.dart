import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data_base_prefs.dart';
import 'interface/data_base.dart';

/// Доступ к базе данных SharedPreferences.
final dbService = Provider<DataBase>((ref) => DataBasePrefs());
