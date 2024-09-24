import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get none => 'None';

  @override
  String get protanopia => 'Protanopia';

  @override
  String get protanomaly => 'Protanomaly';

  @override
  String get deuteranopia => 'Deuteranopia';

  @override
  String get deuteranomaly => 'Deuteranomaly';

  @override
  String get tritanopia => 'Tritanopia';

  @override
  String get tritanomaly => 'Tritanomaly';

  @override
  String get achromatopsia => 'Achromatopsia';

  @override
  String get achromatomaly => 'Achromatomaly';

  @override
  String percent(String filter, double percent) {
    final intl.NumberFormat percentNumberFormat = intl.NumberFormat.decimalPercentPattern(
      locale: localeName,
      decimalDigits: 2
    );
    final String percentString = percentNumberFormat.format(percent);

    return '$filter ($percentString of population)';
  }
}
