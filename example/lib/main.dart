import 'package:color_vision_deficiency/color_deficiency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:color_vision_deficiency/l10n/app_localizations.dart' as cvd;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorDeficiencyFiltered(
      child: const MaterialApp(
        home: MyHomePage(),
        localizationsDelegates: [
          cvd.AppLocalizations.delegate,
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Vision Deficiency Example'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Color Vision Deficiency Checker"),
            subtitle: Expanded(child: ColorDeficiencyDropdown()),
          ),
          Expanded(child: SvgPicture.asset('assets/rainbow.svg', fit: BoxFit.cover)),
        ],
      ),
    );
  }
}