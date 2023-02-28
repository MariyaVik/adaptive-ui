import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../model/person.dart';
import 'popover_list.dart';

class PersonGridTile extends StatelessWidget {
  const PersonGridTile({required this.person, Key? key}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const MoreInfoList(),
            direction: PopoverDirection.bottom,
            width: 150,
            height: 130,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth / 4),
                    child: Image.network(
                      person.photo!,
                      fit: BoxFit.cover,
                      height: constraints.maxWidth / 2,
                      width: constraints.maxWidth / 2,
                    ),
                  );
                },
              ),
              const SizedBox(height: 4),
              Text(person.name!, style: Theme.of(context).textTheme.bodyLarge),
              Text(
                person.email!.toLowerCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
