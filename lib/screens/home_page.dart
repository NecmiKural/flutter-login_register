import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController hobbieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //TODO: scrollable
        child: Wrap(
          children: [
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Name'),
                      subtitle: Text('necmi'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('e-Mail'),
                      subtitle: Text('necmikural.j@gmail.com'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Birthdate'),
                      subtitle: Text('26.08.98'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.text_snippet_sharp),
                      title: Text('Biography'),
                      subtitle: Text('Şöyle oldu böyle oldu'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.auto_awesome),
                      title: Text('Hobbies'),
                    ),
                    // listView builder
                    const Divider(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextField(
                        controller: hobbieController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.add),
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text('Add Hobbie'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
