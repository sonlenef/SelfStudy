import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res/define.dart';
import 'package:flutter_base_architecture/ui/home/home_bloc.dart';
import 'package:provider/provider.dart';

import '../base/define.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(
                top: statusBarHeight,
                right: Dimens.dimen_24,
                bottom: Dimens.dimen_24,
                left: Dimens.dimen_24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.dimen_30),
              color: AppColors.titanWhite,
            ),
            child: Row(children: [
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: Dimens.dimen_24),
                    Text("June 28th",
                        style: Styles.rubikStyle(Dimens.dimen_12,
                            AppColors.balticSea, FontWeight.w200)),
                    Text("Hello, SonLe!",
                        style: Styles.rubikStyle(Dimens.dimen_24,
                            AppColors.balticSea, FontWeight.w600)),
                    const SizedBox(height: Dimens.dimen_12),
                  ])),
              Image.asset(Assets.icPerson,
                  width: Dimens.dimen_24, height: Dimens.dimen_24)
            ]),
          )
        ]),
      ),
    );
  }
}
