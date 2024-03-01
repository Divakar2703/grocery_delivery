import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaceAutocompleteScreen extends StatefulWidget {
  @override
  _PlaceAutocompleteScreenState createState() => _PlaceAutocompleteScreenState();
}

class _PlaceAutocompleteScreenState extends State<PlaceAutocompleteScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];

  void _fetchSuggestions(String input) async {
    final response = await http.get(
      Uri.parse('https://nominatim.openstreetmap.org/search?format=json&q=$input&countrycodes=IN'),
    );

    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> data = json.decode(response.body);
        _suggestions = data.map<String>((result) => result['display_name'] as String).toList();
      });
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Autocomplete'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter a location',
              ),
              onChanged: (input) {
                if (input.isNotEmpty) {
                  _fetchSuggestions(input);
                } else {
                  setState(() {
                    _suggestions = [];
                  });
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                  onTap: () {
                    // Handle selection of suggestion
                    print('Selected: ${_suggestions[index]}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class AlgoliaAutoComplete extends StatefulWidget {
  @override
  _AlgoliaAutoCompleteState createState() => _AlgoliaAutoCompleteState();
}

class _AlgoliaAutoCompleteState extends State<AlgoliaAutoComplete> {
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];

  void _fetchSuggestions(String input) async {
    final response = await http.get(
      Uri.parse('https://places-dsn.algolia.net/1/places/query?query=$input&aroundLatLng=20.5937,78.9629&aroundRadius=2000000&hitsPerPage=10'),
      headers: {
        'X-Algolia-API-Key': 'b648d09ae5d3426140a8734070acdc7e',
        'X-Algolia-Application-Id': '2WBRL2H3PJ',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> hits = json.decode(response.body)['hits'];
        _suggestions = hits.map<String>((hit) => hit['locale_names'][0] as String).toList();
      });
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algolia Place Autocomplete'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter a location',
              ),
              onChanged: (input) {
                if (input.isNotEmpty) {
                  _fetchSuggestions(input);
                } else {
                  setState(() {
                    _suggestions = [];
                  });
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                  onTap: () {
                    // Handle selection of suggestion
                    print('Selected: ${_suggestions[index]}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


