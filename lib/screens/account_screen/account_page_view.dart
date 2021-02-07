import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountPageView extends StatefulWidget {
  @override
  _AccountPageViewState createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/user.svg',
        height: 30,
        width: 30,
      ),
    );
  }
}
