import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res/define.dart';
import 'package:flutter_base_architecture/ui/home/enum/form_type.dart';
import 'package:flutter_base_architecture/ui/home/enum/quantity.dart';
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
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(Dimens.dimen_24),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return bottomSheetContentWidget();
                                });
                          },
                          child: DottedBorder(
                            color: AppColors.fog,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(Dimens.dimen_12),
                            strokeWidth: 2,
                            child: Center(
                                child: SizedBox(
                                    width: Dimens.dimen_60,
                                    height: Dimens.dimen_60,
                                    child: DottedBorder(
                                      color: AppColors.fog,
                                      borderType: BorderType.Circle,
                                      strokeWidth: 2,
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.fog,
                                          size: Dimens.dimen_32,
                                        ),
                                      ),
                                    ))),
                          ),
                        ),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }

  Widget bottomSheetContentWidget() {
    final List<DropdownMenuItem<FormType>> formTypes =
        <DropdownMenuItem<FormType>>[];
    for (final FormType type in FormType.values) {
      formTypes.add(
          DropdownMenuItem<FormType>(value: type, child: Text(type.label)));
    }
    bloc.formTypeSelection(FormType.vocabulary);

    final List<DropdownMenuItem<Quantity>> quantities =
        <DropdownMenuItem<Quantity>>[];
    for (final Quantity qty in Quantity.values) {
      quantities
          .add(DropdownMenuItem<Quantity>(value: qty, child: Text(qty.label)));
    }
    bloc.quantitySelection(Quantity.optionPrimary);
    return Container(
        padding: const EdgeInsets.all(Dimens.dimen_24),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Topic',
                ),
              ),
              const SizedBox(height: Dimens.dimen_16),
              Row(children: [
                Text("Form type:",
                    style: Styles.rubikStyle(Dimens.dimen_16,
                        AppColors.outerSpace, FontWeight.w500)),
                const SizedBox(width: Dimens.dimen_24),
                StreamBuilder(
                    stream: bloc.streamFormType,
                    builder: (context, snapshot) {
                      return DropdownButton<FormType>(
                          value: snapshot.data,
                          onChanged: (FormType? value) {
                            if (value != null) {
                              bloc.formTypeSelection(value);
                            }
                          },
                          items: formTypes);
                    })
              ]),
              const SizedBox(height: Dimens.dimen_12),
              Row(children: [
                Text("Quantity:",
                    style: Styles.rubikStyle(Dimens.dimen_16,
                        AppColors.outerSpace, FontWeight.w500)),
                const SizedBox(width: Dimens.dimen_24),
                StreamBuilder(
                    stream: bloc.streamQty,
                    builder: (context, snapshot) {
                      return DropdownButton<Quantity>(
                          value: snapshot.data,
                          onChanged: (Quantity? value) {
                            if (value != null) {
                              bloc.quantitySelection(value);
                            }
                          },
                          items: quantities);
                    })
              ]),
              const Expanded(child: SizedBox()),
              Row(children: [
                Expanded(
                    child: FilledButton.tonal(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            backgroundColor: AppColors.fog,
                            surfaceTintColor: AppColors.titanWhite),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimens.dimen_14),
                          child: Text(
                            "Submit",
                            style: Styles.rubikStyle(Dimens.dimen_16,
                                AppColors.electricViolet, FontWeight.w400),
                          ),
                        )))
              ]),
              const SizedBox(height: Dimens.dimen_12)
            ]));
  }
}
