import 'package:flutter/material.dart';
import 'package:sqlite/models/person.dart';

class PersonWidget extends StatelessWidget {
  Person person;
  PersonWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(person.name.toString()),
      subtitle: Text(person.age.toString()),
      trailing: IconButton(
        icon: Icon(Icons.edit, color: Colors.blue),
        onPressed: () {
          Navigator.pushNamed(context, "edit_person", arguments: person);
        },
      ),
    );
  }
}
