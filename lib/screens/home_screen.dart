import 'package:flutter/material.dart';
import 'package:sqlite/db/sqflite_db.dart';
import 'package:sqlite/models/person.dart';
import 'package:sqlite/screens/ui/person_widget.dart';
import 'package:sqlite/services/person_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SqfliteDb _database = SqfliteDb.getInstance();

  List<Person> peopleList = [];
  Future<List<Person>> _futureGetAll = PersonServices().showPeople();

  Future<void> refreshGetAll() async {
    setState(() {
      _futureGetAll = PersonServices().showPeople();
    });
  }
  // Future<List<Person>> _people() async {
  //   return await _database.showPeople();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: refreshGetAll,
              child: FutureBuilder(
                future: _futureGetAll,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(child: Text('carregando...'));
                    case ConnectionState.waiting:
                      return Center(child: Text('carregando...'));
                    case ConnectionState.active:
                      return Center(child: Text('carregando...'));
                    case ConnectionState.done:
                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Nenhuma pessoa encontrada"),
                        );
                      }

                      List<Person> listPerson = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: listPerson.length,
                          itemBuilder: (context, index) {
                            return PersonWidget(person: listPerson[index]);
                          },
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
