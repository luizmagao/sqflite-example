import 'package:flutter/material.dart';
import 'package:sqlite/models/person.dart';

class PersonWidget extends StatelessWidget {
  Person person;
  PersonWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    // return Card(child: Text(person.name.toString()));
    return ListTile(
      title: Text(person.name.toString()),
      subtitle: Text(person.age.toString()),
      trailing: IconButton(
        onPressed: () {
          print('ir para tela de editar ${person.name.toString()}');
        },
        icon: Icon(Icons.edit, color: Colors.blueAccent),
      ),
    );
  }
}
