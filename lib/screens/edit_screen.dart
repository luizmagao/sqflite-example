import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqlite/db/sqflite_db.dart';
import 'package:sqlite/models/person.dart';

class EditScreen extends StatefulWidget {
  Person? person;
  EditScreen({super.key, this.person});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final SqfliteDb _database = SqfliteDb.getInstance();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)?.settings.arguments as Person;

    if (person != null) {
      name.text = person.name.toString();
      age.text = person.age.toString();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Editar Pessoa')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Informe seu nome',
              ),
            ),
            TextFormField(
              controller: age,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Informe sua idade',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('send object person');
                print('===> ${name.text}, ${age.text}');

                try {
                  Person data = Person(
                    id: int.parse(person.id.toString()),
                    name: name.text,
                    age: int.parse(age.text),
                  );

                  _database.updatePerson(data);

                  Navigator.pushReplacementNamed(context, 'home');
                } catch (error) {
                  print(error);
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
