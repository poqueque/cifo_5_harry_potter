// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get welcome => 'Benvinguts a Hogwarts';

  @override
  String get strenght => 'Força';

  @override
  String get magic => 'Màgia';

  @override
  String get speed => 'Velocitat';

  @override
  String details(String character) {
    return 'Detalls de $character';
  }

  @override
  String nReviews(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valoracions',
      one: '1 valoració',
      zero: 'sense valoracions',
    );
    return '$_temp0';
  }
}
