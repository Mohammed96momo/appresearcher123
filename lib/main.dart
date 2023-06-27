// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:app26/choosejournal.dart';
import 'package:app26/createaccount.dart';
import 'package:app26/dashboard.dart';
import 'package:app26/staffcollege.dart';
import 'package:app26/writesearch.dart';
import 'package:flutter/material.dart';

import 'my_drawer_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashboard) {
      container == const DashboardPage();
    } else if (currentPage == DrawerSections.staffcollege) {
      container == const StaffCollegePage();
    } else if (currentPage == DrawerSections.writesearch) {
      container == const WriteSearchPage();
    } else if (currentPage == DrawerSections.choosejournal) {
      container == const ChooseJournalPage();
    } else if (currentPage == DrawerSections.createaccount) {
      container == const CreateAccountPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("University of Al-Ameed"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [const MyHeaderDrawer(), MyDrawerList()],
          ),
        ),
      ),
    );
  }
}

Widget MyDrawerList() {
  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      //show the list of menu drawer
      children: [
        menuItem(1, "Dashboard", Icons.dashboard_outlined,
            currentPage == DrawerSections.dashboard ? true : false),
        menuItem(2, "StaffCollege", Icons.people,
            currentPage == DrawerSections.staffcollege ? true : false),
        menuItem(3, "Write Search", Icons.note_add,
            currentPage == DrawerSections.writesearch ? true : false),
        menuItem(4, "Choose Journal", Icons.book_online,
            currentPage == DrawerSections.choosejournal ? true : false),
        const Divider(),
        menuItem(5, "Create account", Icons.account_balance,
            currentPage == DrawerSections.createaccount ? true : false),
      ],
    ),
  );
}

Widget menuItem(int id, String title, IconData icon, bool selected) {
  var currentPage = DrawerSections.dashboard;
  return Material(
    color: selected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pop(context as BuildContext);
        setState(() {
          if (id == 1) {
            currentPage == DrawerSections.dashboard;
          } else if (id == 2) {
            currentPage == DrawerSections.staffcollege;
          } else if (id == 3) {
            currentPage == DrawerSections.writesearch;
          } else if (id == 4) {
            currentPage == DrawerSections.choosejournal;
          } else if (id == 5) {
            currentPage == DrawerSections.createaccount;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void setState(Null Function() param0) {}

enum DrawerSections {
  dashboard,
  staffcollege,
  writesearch,
  choosejournal,
  createaccount,
}
