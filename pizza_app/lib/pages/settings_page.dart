import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // backgroundColor: Colors.transparent,
        title: Text('Setitings',
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(left: 25,top: 10,right: 15),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // text
                Text('Dark Mode',style:
                TextStyle(fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),),
                // switch
                CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                    onChanged:(value){
                      Provider.of<ThemeProvider>(context, listen: false).toggletheme();
                    }
                ),
                // Image.asset('assets/burger/hamburger.jpg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
