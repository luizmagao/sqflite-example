import 'package:flutter/material.dart';
import 'package:sqlite/db/sqflite_db.dart';
import 'package:sqlite/models/person.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SqfliteDb _database = SqfliteDb.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Home Screen')),
          ElevatedButton(
            onPressed: () {
              Person person = Person(name: 'John Doe');
              _database.insertPerson(person);
              print('Person added');
            },
            child: Text('Execute'),
          ),
          ElevatedButton(
            onPressed: () {
              print('Open form person');
              Navigator.pushNamed(context, 'add_person');
            },
            child: Text('Add Form Person'),
          ),
        ],
      ),
    );
  }
}
