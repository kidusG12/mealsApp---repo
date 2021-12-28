import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer_widget.dart';

class FilterPage extends StatefulWidget {
  static const routeName = '/filter-page';

  final Map<String, bool> currentFilter;
  final Function(Map<String, bool>) setFilter;
  FilterPage(this.currentFilter,this.setFilter);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget buildSwitchListView(
    String title,
    String subtitle,
    bool val,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: val,
      onChanged: updateValue,
    );
  }
@override
  void initState() {
  _glutenFree = widget.currentFilter['gluten'] ?? false;
  _vegetarian = widget.currentFilter['vegetarian']?? false;
  _vegan = widget.currentFilter['vegan']?? false;
  _lactoseFree = widget.currentFilter['lactoseFree']?? false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters = {
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.setFilter(selectedFilters);
            Navigator.of(context).pushReplacementNamed('/');
          }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListView(
                'Gluten-Free',
                'only include gluten-free meals only',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitchListView(
                'Vegetarian',
                'only include vegetarian meals only',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              buildSwitchListView(
                'vegan',
                'only include vegan meals only',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              buildSwitchListView(
                'Lactose-Free',
                'only include lactose-free meals only',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
