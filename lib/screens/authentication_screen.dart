import 'package:flukey_hackathon/bloc/authentication/authentication_bloc.dart';
import 'package:flukey_hackathon/screens/login_screen/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.of(context).maybePop();
          return HomePage();
        }

        return LoginScreenView();
      },
    );
  }
}
