import 'package:flukey_hackathon/screens/login_screen/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreenView extends StatefulWidget {
  @override
  _OnboardingScreenViewState createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      //TODO burdan giriş sayfasına gidecek
      MaterialPageRoute(builder: (_) => LoginScreenView()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset(
        'assets/icons/$assetName.svg',
        height: 200,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0, color: Colors.black);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: Text(
            'EDUCATION FOR EVERYONE',
            style: TextStyle(color: Colors.black, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          body:
              'Education is the most powerful weapon which you can use to change the world.\n\nNelson Mandela',
          image: _buildImage('education'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text(
            'NO POVERTY',
            style: TextStyle(color: Colors.black, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          body: 'Part of being a person is about helping others.',
          image: _buildImage('join'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        _onIntroEnd(context);
      },
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.black),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
