import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final user = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  List userHobbiesList = [];

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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: [
              Center(
                child: Card(
                  child: FutureBuilder(
                      future: user.get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          userHobbiesList = data['hobbie'];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                // TODO: user image eklenebilir
                                leading: const Icon(Icons.person),
                                title: const Text('Name'),
                                subtitle: Text("${data['name']}"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.mail),
                                title: const Text('e-Mail'),
                                subtitle: Text("${data['email']}"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.calendar_today),
                                title: const Text('Birthdate'),
                                subtitle: Text("${data['birthdate']}"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.text_snippet_sharp),
                                title: const Text('Biography'),
                                subtitle: Text("${data['biography']}"),
                              ),
                              const ListTile(
                                leading: Icon(Icons.auto_awesome),
                                title: Text('Hobbies'),
                              ),
                              // TODO: listView builder, getx
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: userHobbiesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: const Icon(
                                      Icons.lens_rounded,
                                      size: 10.0,
                                    ),
                                    title: Text(
                                      userHobbiesList[index],
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  );
                                },
                              ),
                              const Divider(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
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
                                    onPressed: addHobbie,
                                    child: const Text('Add Hobbie'),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
              const Center(child: SizedBox(height: 20)),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Sign Out'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future addHobbie() async {
    //TODO: try catch
    //TODO: delete hobbies eklenebilir

    user.get().then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        List userHobbies = data['hobbie'];
        userHobbies.add(hobbieController.text.trim());
        userHobbies = userHobbies.toSet().toList();
        userHobbies.removeWhere((item) => item.isEmpty);
        await user.set({"hobbie": userHobbies}, SetOptions(merge: true)).then(
            (value) {
          // çok  tehlikeli
          setState(() {
            userHobbiesList;
          });
          hobbieController.text = "";
        });
      }
    });
  }
}
