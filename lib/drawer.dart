import 'package:ecomart/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onHomeTap;
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
    required this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightGreen[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(children: [
             const DrawerHeader(
               child: Icon(
                 Icons.person,
                 color: Colors.white,
                 size: 64,
               ),
             ),
             MyListTile(
               icon: Icons.home,
               text: 'H O M E',
               onTap: onHomeTap,
             ),
             MyListTile(
               icon: Icons.person,
               text: 'P R O F I L E',
               onTap: onProfileTap,
             ),
             MyListTile(
               icon: Icons.info_outline,
                 text: 'A B O U T  U S',
                 onTap: () {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, 'about');
                 },
             ),
              MyListTile(
                icon: Icons.contact_support_outlined,
                text: 'C O N T A CＴ  U S',
                onTap:() {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'contact');
                },
              ),
            ],
           ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: onSignOut,
              ),
            ),
        ],
      ),
    );
  }
}
