import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class SearchWithSuggestionDelegate extends SearchDelegate<String> {
  ///[onSearchChanged] gets the [query] as an argument. Then this callback
  ///should process [query] then return an [List<String>] as suggestions.
  ///Since its returns a [Future] you get suggestions from server too.
  final OnSearchChanged onSearchChanged;
  bool isload = false;

  ///This [_oldFilters] used to store the previous suggestions. While waiting
  ///for [onSearchChanged] to completed, [_oldFilters] are displayed.
  List<String> _oldFilters = const [];

  SearchWithSuggestionDelegate(
      {super.searchFieldLabel, required this.onSearchChanged});

  ///
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

  ///OnSubmit in the keyboard, returns the [query]
  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  ///Since [showResults] is overridden we can don't have to build the results.
  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: onSearchChanged != null ? onSearchChanged(query) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData) _oldFilters = snapshot.data!;
        return isload
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StatefulBuilder(
                builder: (context, setState) => ListView.builder(
                  itemCount: _oldFilters.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.restore),
                      title: Text(_oldFilters[index]),
                      trailing: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          _oldFilters.removeAt(index);
                          print(_oldFilters);
                          print("object");
                          final pref = await SharedPreferences.getInstance();
                          pref.getStringList("recentSearches");

                          pref.setStringList(
                              "recentSearches", _oldFilters.toList());

                          //Use `Set` to avoid duplication of recentSearches
                          Set<String> allSearches =
                              pref.getStringList("recentSearches")?.toSet() ??
                                  {};
                          setState(() {
                            _oldFilters = allSearches.toList();
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                      onTap: () => close(context, _oldFilters[index]),
                    );
                  },
                ),
              );
      },
    );
  }
}
