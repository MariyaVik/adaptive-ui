import 'package:flutter/material.dart';

import '../model/person.dart';
import 'popover_list.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({required this.person, Key? key}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 140,
                  child: MoreInfoList(),
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height / 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius:
                          BorderRadius.circular(constraints.maxHeight / 2),
                      child: Image.network(
                        person.photo!,
                        fit: BoxFit.cover,
                        height: constraints.maxHeight,
                        width: constraints.maxHeight,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(person.name!,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(person.email!.toLowerCase(),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
