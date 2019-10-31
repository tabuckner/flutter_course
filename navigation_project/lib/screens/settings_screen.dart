import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/shared/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen({
    this.saveFilters,
    this.currentFilters,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    this._glutenFree = widget.currentFilters['gluten'];
    this._lactoseFree = widget.currentFilters['lactose'];
    this._vegan = widget.currentFilters['vegan'];
    this._vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24),
            child: Text(
              'Adjust your meal selections.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                this._buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals.',
                  this._glutenFree,
                  (newValue) {
                    setState(() {
                      this._glutenFree = newValue;
                    });
                  },
                ),
                this._buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals.',
                  this._lactoseFree,
                  (newValue) {
                    setState(() {
                      this._lactoseFree = newValue;
                    });
                  },
                ),
                this._buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  this._vegetarian,
                  (newValue) {
                    setState(() {
                      this._vegetarian = newValue;
                    });
                  },
                ),
                this._buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  this._vegan,
                  (newValue) {
                    setState(() {
                      this._vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
