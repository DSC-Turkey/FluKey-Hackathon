import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPageView extends StatefulWidget {
  @override
  _SettingsPageViewState createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/settings.svg',
        height: 30,
        width: 30,
      ),
    );
  }
}
