import 'package:flutter/material.dart';

enum Weapon {
  magical(7),
  sharp(5),
  heavy(3);

  const Weapon(this.damage);
  final int damage;
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = [Weapon.magical, Weapon.sharp, Weapon.heavy];
  var modifiers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enums as Decorators-like'),
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(),
            Wrap(
              children: [
                ...items
                    .map((item) => ActionChip(
                          backgroundColor: modifiers.contains(item)
                              ? Colors.blue
                              : Colors.grey,
                          label: Text(item.name.toString()),
                          onPressed: () {
                            setState(() {
                              modifiers.contains(item)
                                  ? modifiers.remove(item)
                                  : modifiers.add(item);
                            });
                          },
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int value = getSum(modifiers);
          print(value);
        },
        child: const Icon(Icons.square),
      ),
    );
  }
}

int getSum(weapons) =>
    weapons.fold(0, (previousValue, element) => previousValue + element.damage);
