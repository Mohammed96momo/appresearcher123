import 'package:flutter/material.dart';

import 'my_drawer_header.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return     const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}

 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.green[700] ,
        title: const Text("University of Al-Ameed"),
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList()

            ],
          ),
        ),
      ),
    );
  }
}
