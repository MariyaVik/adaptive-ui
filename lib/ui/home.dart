import 'package:flutter/material.dart';

import '../model/person.dart';
import '../services/load_people.dart';
import '../theme/color_palette.dart';
import 'common/check_width.dart';
import 'grid_item.dart';
import 'list_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String title = 'Adaptive UI';
  List<Person> people = [];

  Future<void> getPeople() async {
    people = await PeopleApi().loadPeople();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: !CurrentScreen.isDesktop(context)
            ? AppBar(
                centerTitle: true,
                elevation: 0,
                title: Text(title),
              )
            : const PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        body: Row(
          children: [
            if (CurrentScreen.isDesktop(context))
              Container(
                alignment: Alignment.topCenter,
                color: Colorful.blueDark,
                width: MediaQuery.of(context).size.width / 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            people.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CurrentScreen.isDesktop(context)
                          ? GridView.builder(
                              itemCount: people.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return PersonGridTile(person: people[index]);
                              })
                          : ListView.builder(
                              itemCount: people.length,
                              itemBuilder: (contex, index) {
                                return PersonListTile(person: people[index]);
                              }),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
