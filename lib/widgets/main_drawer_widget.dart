import 'package:flutter/material.dart';
import 'package:meals/pages/filter_page.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child:const Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: const Icon(Icons.restaurant,size: 26,),
            title: const Text('Meals',style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
          ),
          const SizedBox(height: 10),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FilterPage.routeName);
            },
            leading: const Icon(Icons.settings,size: 26,),
            title: const Text('Filters',style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}
