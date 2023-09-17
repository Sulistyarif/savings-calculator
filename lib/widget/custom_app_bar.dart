import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? name;
  const CustomAppBar({super.key, @required this.name});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.name ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ),
      backgroundColor: Colors.teal[50],
    );
  }
}
