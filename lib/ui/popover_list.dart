import 'package:flutter/material.dart';

class MoreInfoList extends StatelessWidget {
  const MoreInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text('Профиль'),
              ],
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(Icons.people),
                SizedBox(width: 8),
                Text('Друзья'),
              ],
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(Icons.description_outlined),
                SizedBox(width: 8),
                Text('Статьи'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
