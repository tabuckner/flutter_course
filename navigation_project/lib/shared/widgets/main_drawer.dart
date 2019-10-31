import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildMenuItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(24),
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Wrist Flippin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          this.buildMenuItem(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          this.buildMenuItem(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
