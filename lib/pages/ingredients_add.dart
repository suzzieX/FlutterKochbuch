//susi was sadly here
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'dart:async';


void main() => runApp(const ingredients());

class ingredients extends StatefulWidget {
  const ingredients({super.key});

  @override
  State<ingredients> createState() => _ingredientsState();
  
}

class _ingredientsState extends State<ingredients> {
  //für fetch
  final String apiUrl = "https://trackapi.nutritionix.com/v2/search/instant";

  Future<List<food>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['data'] as List)
        .map((e) => food.fromJson(e))
        .toList();
  //
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zutaten hinzufügen/editieren'),
        ),
        body: Center(
          child:Column(
            children: const [
            name_ingredients(),
            category_list(),
            nutrition_table(),
             ],)      
        ),
      ),
    );
    
  }
}
 //api fetch :( WIP

 class food {
  int food_name;
  String nf_calories;
  String brand_name;


  food(
      {required this.food_name,
      required this.nf_calories,
      required this.brand_name});

  factory food.fromJson(Map<String, dynamic> json) {
    return food(
        food_name: json['food_name'],
        nf_calories: json['nf_calories'],
        brand_name: json['brand_name']);
  }
}



//widgets

class name_ingredients extends StatelessWidget {
  const name_ingredients({super.key});

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}

class category_list extends StatefulWidget {
  const category_list({super.key});

  @override
  State<category_list> createState() => _category_listState();
}

class _category_listState extends State<category_list> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ExpansionTile(
          title: Text('Kategorien'),        
          children: <Widget>[
            ListTile(title: Text('Kategorie1')),
          ],
        ),
      ],
    );
  }
}

//table

class nutrition_table extends StatelessWidget {
  const nutrition_table({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nährwerte',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Wert pro 100g',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Energie')),
            DataCell(Text('19')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Fett')),
            DataCell(Text('43')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Kohlenhydrate')),
            DataCell(Text('27')),
          ],
        ),
         DataRow(
          cells: <DataCell>[
            DataCell(Text('Zucker')),
            DataCell(Text('27')),
          ],
        ), DataRow(
          cells: <DataCell>[
            DataCell(Text('Eiweiß')),
            DataCell(Text('27')),
          ],
        ), DataRow(
          cells: <DataCell>[
            DataCell(Text('Salz')),
            DataCell(Text('27')),
          ],
        ),
      ],
    );
  }
}

