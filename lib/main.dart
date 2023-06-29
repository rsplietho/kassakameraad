import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [CupertinoTabBar].

void main() => runApp(const CupertinoTabBarApp());

class CupertinoTabBarApp extends StatelessWidget {
  const CupertinoTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoTabBarExample(),
    );
  }
}

class CupertinoTabBarExample extends StatelessWidget {
  const CupertinoTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar_alt_fill),
            label: 'Statistieken',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Bestellen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Bestelling',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab $index'),
            );
          },
        );
      },
    );
  }
}
