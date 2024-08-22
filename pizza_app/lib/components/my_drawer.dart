import 'package:flutter/material.dart';
import 'package:pizza_app/components/my_drawer_tile.dart';
import 'package:pizza_app/pages/settings_page.dart';
import 'package:pizza_app/services/auth/auth_service.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(Icons.lock_open_rounded,size: 60,
            color: Theme.of(context).colorScheme.inversePrimary,),
          ),

          Padding(padding: EdgeInsets.all(25),child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),),

          // home list tile
          MyDrawerTile(text: 'H O M E',
            onTap: (){},
            icon: Icons.home,
          ),

          // settings list tile
          MyDrawerTile(text: 'S E T T I N G S',
            onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icons.settings,
          ),

          Spacer(),

          //logout list tile
          MyDrawerTile(text: 'L O G O U T',
            onTap: (){
              logout();
            },
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
