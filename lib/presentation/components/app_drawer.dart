import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              child: Material(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          Column(
            children: [
              const ListTile(
                title: Text('List Item 1'),
              ).padding(bottom: 10),
              const ListTile(
                title: Text('List Item 2'),
              ).padding(bottom: 10),
              const ListTile(
                title: Text('List Item 3'),
              ).padding(bottom: 10),
            ],
          ),
        ],
      ),
    );
  }
}
