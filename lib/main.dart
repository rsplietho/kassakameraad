import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/logo': (context) => const LogoPage(),
        '/directe_verkoop': (context) => const DirecteVerkoopPage(),
        '/number_page': (context) => const NumberPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D7791),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/logo');
              },
              child: const Text('Logo'),
            ),
          ],
        ),
        actions: [
          Container(
            color: Colors.red, // Set the background color to red
            child: Row(
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/directe_verkoop');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.center,
                      child: const Text('Directe Verkoop'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: List.generate(21, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/number_page',
                arguments: {'number': index + 1},
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              color: const Color(0xFFD9D9D9),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo Page'),
      ),
      body: const Center(
        child: Text(
          'Logo',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class DirecteVerkoopPage extends StatelessWidget {
  const DirecteVerkoopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directe Verkoop Page'),
      ),
      body: const Center(
        child: Text(
          'Directe Verkoop',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class NumberPage extends StatelessWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final number = args['number'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Page'),
      ),
      body: Center(
        child: Text(
          'Number: $number',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
