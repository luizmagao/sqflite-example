import 'package:flutter/material.dart';
import 'package:sqlite/db/sqflite_db.dart';
import 'package:sqlite/models/person.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final SqfliteDb _database = SqfliteDb.getInstance();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionando Pessoa')),
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
                  Person person = Person(
                    name: name.text,
                    age: int.parse(age.text),
                  );

                  _database.insertPerson(person);

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
