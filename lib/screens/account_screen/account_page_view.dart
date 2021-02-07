import 'package:flukey_hackathon/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/extensions.dart';

class AccountPageView extends StatefulWidget {
  @override
  _AccountPageViewState createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(),
              Container(
                padding: context.paddingAllMedium,
                child: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    context.read<LoginBloc>().add(LogoutButtonPressed());
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
