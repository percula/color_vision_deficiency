import 'package:flutter/widgets.dart';

import 'l10n/app_localizations.dart';

enum ColorDeficiencyFilter {
  protanopia(
      colorFilterMatrix: <double>[
      0.567, 0.433, 0, 0, 0,
      0.558, 0.442, 0, 0, 0,
      0, 0.242, 0.758, 0, 0,
      0, 0, 0, 1, 0,
    ],
    populationPercentage: 0.01),
  protanomaly(
      colorFilterMatrix: <double>[
        0.817,0.183,0,0,0,
        0.333,0.667,0,0,0,
        0,0.125,0.875,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.01),
  deuteranopia(
      colorFilterMatrix: <double>[
        0.625,0.375,0,0,0,
        0.7,0.3,0,0,0,
        0,0.3,0.7,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.01),
  deuteranomaly(
      colorFilterMatrix: <double>[
        0.8,0.2,0,0,0,
        0.258,0.742,0,0,0,
        0,0.142,0.858,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.05),
  tritanopia(
      colorFilterMatrix: <double>[
        0.95,0.05,0,0,0,
        0,0.433,0.567,0,0,
        0,0.475,0.525,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.0001),
  tritanomaly(
      colorFilterMatrix: <double>[
        0.967,0.033,0,0,0,
        0,0.733,0.267,0,0,
        0,0.183,0.817,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.0001),
  achromatopsia(
      colorFilterMatrix: <double>[
        0.299,0.587,0.114,0,0,
        0.299,0.587,0.114,0,0,
        0.299,0.587,0.114,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.0001),
  achromatomaly(
      colorFilterMatrix: <double>[
        0.618,0.320,0.062,0,0,
        0.163,0.775,0.062,0,0,
        0.163,0.320,0.516,0,0,
        0,0,0,1,0
      ],
      populationPercentage: 0.0001);

  final List<double> colorFilterMatrix;
  final double populationPercentage;

  const ColorDeficiencyFilter({
    required this.colorFilterMatrix,
    required this.populationPercentage,
  });

  String? displayName(BuildContext context) {
    switch(this) {
      case ColorDeficiencyFilter.protanopia:
        return AppLocalizations.of(context)?.protanopia;
      case ColorDeficiencyFilter.protanomaly:
        return AppLocalizations.of(context)?.protanomaly;
      case ColorDeficiencyFilter.deuteranopia:
        return AppLocalizations.of(context)?.deuteranopia;
      case ColorDeficiencyFilter.deuteranomaly:
        return AppLocalizations.of(context)?.deuteranomaly;
      case ColorDeficiencyFilter.tritanopia:
        return AppLocalizations.of(context)?.tritanopia;
      case ColorDeficiencyFilter.tritanomaly:
        return AppLocalizations.of(context)?.tritanomaly;
      case ColorDeficiencyFilter.achromatopsia:
        return AppLocalizations.of(context)?.achromatopsia;
      case ColorDeficiencyFilter.achromatomaly:
        return AppLocalizations.of(context)?.achromatomaly;
    }
  }

}