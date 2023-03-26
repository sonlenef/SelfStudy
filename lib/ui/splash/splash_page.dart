import 'dart:async';

import 'package:flutter/material.dart';

import '../../res/define.dart';
import '../define.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.whiteLilac,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.dimen_24),
        child: Image.asset(Assets.imgSplash),
      )),
    ));
  }

  @override
  void initState() {
    super.initState();
    startTimer(context);
  }

  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushAndRemoveUntil(AppRoute.home.page, (route) => false);
    });
  }
}
