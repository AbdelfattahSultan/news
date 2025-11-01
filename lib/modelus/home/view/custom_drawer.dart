import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function()? onTap;
  const CustomDrawer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff171717),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: DrawerHeader(
              child: Center(
                child: Text(
                  "News App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                "Go To Home",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(color: Colors.white),
        ],
      ),
    );
  }
}
