import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
