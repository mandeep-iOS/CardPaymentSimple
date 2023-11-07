import 'package:flutter/material.dart';
import 'package:paymenttest/export.dart';

import 'core/providers/app_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    Provider<BuildContext>(create: (c) => c),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeType = context.select<AppProvider, ThemeType>((val) => val.theme);
    AppTheme theme = AppTheme.fromType(themeType);
    return Provider.value(
      value: theme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'pay App',
        theme: theme.themeData,
        home: const LogInScreen(),
        builder: (context, child) => MediaQuery(
          data: context.widthPx < 600
              ? context.mq.copyWith(textScaleFactor: .8)
              : context.mq.copyWith(textScaleFactor: 1),
          child: child!,
        ),
      ),
    );
  }
}
