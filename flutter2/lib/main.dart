import 'package:flutter/material.dart';
import 'package:flutter1/colored_page.dart';

void main() {
  runApp(MyApp());
}

Route switchPages({
  required Widget from,
  required Widget to,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => to,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: <Widget>[
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(-1.0, 0.0),
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: from,
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          )
        ],
      );
    },
  );
}

class MyApp extends StatelessWidget {
  final pages = [
    ColoredPage(
      color: Colors.blue,
      buttonText: "На экран 2",
      onTextTap: (pageContext) =>
          Navigator.popAndPushNamed(pageContext, "/second"),
    ),
    ColoredPage(
      color: Colors.green,
      buttonText: "На экран 1",
      onTextTap: (pageContext) =>
          Navigator.popAndPushNamed(pageContext, "/first"),
    ),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/first',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/first':
            return switchPages(from: pages[1], to: pages[0]);
          case '/second':
            return switchPages(from: pages[0], to: pages[1]);
          default:
            return null;
        }
      },
    );
  }
}
