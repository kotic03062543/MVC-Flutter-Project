import 'package:flutter/material.dart';

class NewsNavigate extends StatefulWidget {
  NewsNavigate({Key? key}) : super(key: key);

  @override
  State<NewsNavigate> createState() => _NewsNavigateState();
}

class _NewsNavigateState extends State<NewsNavigate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
