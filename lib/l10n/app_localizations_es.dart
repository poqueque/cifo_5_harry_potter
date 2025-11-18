// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'Bienvenidos a Hogwarts';

  @override
  String get strenght => 'Fuerza';

  @override
  String get magic => 'Magia';

  @override
  String get speed => 'Velocidad';

  @override
  String details(String character) {
    return 'Detalles de $character';
  }

  @override
  String nReviews(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reseñas',
      one: '1 reseña',
      zero: 'sin reseñas',
    );
    return '$_temp0';
  }
}
