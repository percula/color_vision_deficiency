import 'package:color_vision_deficiency/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'color_deficiency_filter.dart';

ValueNotifier<ColorDeficiencyFilter?> currentColorDeficiencyFilterNotifier = ValueNotifier(null);

/// Filters the color of [child] to approximate the selected [ColorDeficiencyFilter].
/// Use this towards the top of your widget tree, for example above your
/// [MaterialApp].
///
/// Specify [initialValue] or use [ColorDeficiencyDropdown], which works with
/// this widget.
///
/// There is no performance
class ColorDeficiencyFiltered extends StatelessWidget {

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// Whether this widget should be enabled. Defaults to [kDebugMode] so that
  /// there won't be an impact on production performance.
  final bool enabled;

  ColorDeficiencyFiltered({
    super.key,
    required this.child,
    ColorDeficiencyFilter? initialValue,
    this.enabled = kDebugMode,
  }) {
    if (initialValue != null) {
      currentColorDeficiencyFilterNotifier.value = initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return ValueListenableBuilder<ColorDeficiencyFilter?>(
        valueListenable: currentColorDeficiencyFilterNotifier,
        child: child,
        builder: (context, selectedColorFilter, child) {
          if (selectedColorFilter != null) {
            return ColorFiltered(
              colorFilter: ColorFilter.matrix(selectedColorFilter.colorFilterMatrix),
              child: this.child,
            );
          } else {
            return this.child;
          }
        }
      );
    } else {
      return child;
    }
  }

}


/// A widget that provides a [DropdownButton] with different Color Vision Deficiency
/// (CVD) types. Upon selection, the selected CVD will be applied by
/// [ColorDeficiencyFiltered]
///
/// IMPORTANT: To use this localized widget, you must include the translations
/// delegate in your [MaterialApp] constructor:
///
/// ```dart
/// import 'package:color_vision_deficiency/l10n/app_localizations.dart' as cvd;
///
/// MaterialApp(
///   ...
///   localizationsDelegates: [
///    ...AppLocalizations.localizationsDelegates,
///    cvd.AppLocalizations.delegate,
///   ],
///   supportedLocales: S.locales,
/// );
/// ```
///
/// English is the only supported language right now, but PRs are welcome for
/// other languages.
class ColorDeficiencyDropdown extends StatelessWidget {

  const ColorDeficiencyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentColorDeficiencyFilterNotifier,
      builder: (context, selectedColorFilter, _) {
        return DropdownButton<ColorDeficiencyFilter?>(
            value: selectedColorFilter,
            items: [
              DropdownMenuItem<ColorDeficiencyFilter?>(
                value: null,
                child: Text(AppLocalizations.of(context)?.none ?? ''),
              ),
              ...ColorDeficiencyFilter.values.map((filter) => DropdownMenuItem(
                    value: filter,
                    child: Text(AppLocalizations.of(context)?.percent(
                            filter.displayName(context) ?? '',
                            filter.populationPercentage) ?? ''),
                  ))
            ],
            onChanged: (value) {
              currentColorDeficiencyFilterNotifier.value = value;
            });
      },
    );
  }
}