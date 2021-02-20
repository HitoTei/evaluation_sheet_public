import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MyApp();
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
          primarySwatch: Colors.blue,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '評価シート',
          theme: theme,
          initialRoute: '/',
          routes: {
            '/': (_) => Home(),
          },
          navigatorObservers: [
            RouteObserver<PageRoute<dynamic>>(),
          ],
        ),
      ),
    );
  }
}
