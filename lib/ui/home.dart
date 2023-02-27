import 'package:flutter/material.dart';

import '../model/person.dart';
import '../services/load_people.dart';
import '../theme/color_palette.dart';
import 'common/check_width.dart';
import 'grid_item.dart';
import 'list_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final String title = 'Это интересно';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FutureBuilder(
                future: PeopleApi().loadPeople(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Person>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(child: Text('NONE'));
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      return CurrentScreen.isDesktop(context)
                          ? GridView.builder(
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return PersonGridTile(
                                    person: snapshot.data![index]);
                              })
                          : ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (contex, index) {
                                return PersonListTile(
                                    person: snapshot.data![index]);
                              });
                    default:
                      return const SingleChildScrollView(
                          child: Text('Default'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
