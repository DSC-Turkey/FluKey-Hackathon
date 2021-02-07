import 'package:flukey_hackathon/bloc/login/login_bloc.dart';
import 'package:flukey_hackathon/common/extensions.dart';
import 'package:flukey_hackathon/screens/signup_screen/signup_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:neumorphic/neumorphic.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color.fromRGBO(238, 238, 238, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.error,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                      duration: Duration(seconds: 3),
                    ));
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildFluKeyTitle(),
                    buildLoginTitle(),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: NeuCard(
                        alignment: Alignment.center,
                        height: SizeExtension(context).dynamicHeight(0.08),
                        width: SizeExtension(context).dynamicWidth(0.9),
                        curveType: CurveType.flat,
                        color: Colors.white,
                        decoration: NeumorphicDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color.fromRGBO(238, 238, 238, 1)),
                        child: TextFormField(
                          controller: _emailController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'email',
                              focusColor: Colors.black,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 16),
                      child: NeuCard(
                        alignment: Alignment.center,
                        height: SizeExtension(context).dynamicHeight(0.08),
                        width: SizeExtension(context).dynamicWidth(0.9),
                        curveType: CurveType.flat,
                        color: Colors.white,
                        decoration: NeumorphicDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color.fromRGBO(238, 238, 238, 1)),
                        child: TextFormField(
                          controller: _passwordController,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'password',
                              focusColor: Colors.black,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: SizeExtension(context).dynamicHeight(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 16),
                            child: InkWell(
                              child: NeuCard(
                                alignment: Alignment.center,
                                height:
                                    SizeExtension(context).dynamicHeight(0.05),
                                width: SizeExtension(context).dynamicWidth(0.3),
                                curveType: CurveType.flat,
                                color: Colors.white,
                                decoration: NeumorphicDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.grey.shade200),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onTap: () {
                                context.read<LoginBloc>().add(
                                    LoginButtonPressed(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: InkWell(
                              child: NeuCard(
                                height: 32,
                                width: 150,
                                curveType: CurveType.concave,
                                bevel: 12,
                                decoration: NeumorphicDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.grey.shade100),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Login with Google',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Icon(
                                      FontAwesome.google,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                debugPrint('google ile giriş yapıldı');
                                context
                                    .read<LoginBloc>()
                                    .add(GoogleButtonPressed());
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: InkWell(
                              child: NeuCard(
                                alignment: Alignment.center,
                                height:
                                    SizeExtension(context).dynamicHeight(0.05),
                                width: SizeExtension(context).dynamicWidth(0.3),
                                curveType: CurveType.flat,
                                color: Colors.white,
                                decoration: NeumorphicDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Color.fromRGBO(238, 238, 238, 1)),
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpScreen())); //TODO
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Container buildFluKeyTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 32, bottom: 25),
      child: Text(
        'FluKey',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 48),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Container buildLoginTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 32),
      child: Text(
        'Login',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    );
  }
}
