import 'package:flutter/material.dart';
import 'package:paymenttest/export.dart';

import '../payment/paywith_card_option.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with FormMixin {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(10.0),
                IntroImage(
                  onboardImg: R.png.loginLog.imgPng,
                ).center(),
                const VSpace(15.0),
                Text(
                  R.S.login,
                  style: TextStyles.h4
                      .copyWith(fontSize: 36, fontWeight: FontWeight.w700),
                ),
                const VSpace(20),
                CustomFormTextInput(
                  label: R.S.email,
                ),
                const VSpace(15),
                CustomFormTextInput(
                  label: R.S.password,
                ),
                const VSpace(10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    R.S.forgotPassword,
                    style: TextStyles.body2.copyWith(color: theme.primary),
                  ).rippleClick(() {}),
                ),
                const VSpace(29),
                PrimaryButton(
                  onPressed: () {
                    validate(
                      () {
                        context.push(const AddNewCardScreen());
                      },
                    );
                  },
                  label: R.S.conti,
                  fullWidth: true,
                  radius: Corners.s10,
                ),
                const VSpace(25),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    R.S.or,
                    style: TextStyles.body2.copyWith(color: theme.greyWeak),
                  ).rippleClick(() {}),
                ),
                const VSpace(18),
                ColoredBoxWithBorder(
                  color: theme.cardColor,
                  borderRadius: Corners.s8Border,
                  boxChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30,
                          child: SvgPicture.asset(R.png.google.svg)), //
                      const HSpace(15),
                      Text(
                        R.S.logInWithGoogle,
                        style: TextStyles.h5.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ).center(),
                const VSpace(42),
                Align(
                  alignment: Alignment.center,
                  child: Wrap(children: [
                    Text(
                      R.S.newHere,
                      style: TextStyles.body2
                          .copyWith(fontSize: 13, color: theme.greyWeak),
                    ),
                    Text(
                      R.S.register,
                      style: TextStyles.body2.copyWith(
                        fontSize: 13,
                        color: theme.primary,
                      ),
                    )
                  ]).rippleClick(() {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
