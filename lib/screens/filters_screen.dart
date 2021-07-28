import 'package:flutter/material.dart';
import './main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function? savedFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.savedFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = (widget.currentFilters['gluten'] as bool);
    _lactoseFree = (widget.currentFilters['lactose'] as bool);
    _vegeterian = (widget.currentFilters['vegeterian'] as bool);
    _vegan = (widget.currentFilters['vegan'] as bool);
    super.initState();
  }

  Widget _bulildSwitchListTile(String title, String description,
      bool currentValue, Function? updateValue(bool)) {
    return SwitchListTile(
      activeColor: Color.fromRGBO(11, 193, 191, 1),
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(11, 193, 191, 1),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(2.0, 2.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.savedFilters!(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Text('Adjust your meal selection',
                    style: Theme.of(context).textTheme.title),
              ),
              Expanded(
                  child: ListView(
                children: [
                  _bulildSwitchListTile(
                      'Gluten Free',
                      'only include gluten free meals',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _bulildSwitchListTile(
                      'Vegeterian',
                      'only include vegeterian  meals',
                      _vegeterian, (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
                  _bulildSwitchListTile(
                      'Vegan', 'only include Vegan  meals', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _bulildSwitchListTile(
                      'Lactose Free',
                      'only include lactose free  meals',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
