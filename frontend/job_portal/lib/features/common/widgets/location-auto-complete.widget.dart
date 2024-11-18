import 'dart:convert';

import 'package:job_portal/global_constants.dart';

import '../../design_system/decorated-text.widget.dart';
import 'package:flutter/material.dart';

class LocationAutoCompletePage extends StatefulWidget {
  @override
  _LocationAutoCompletePageState createState() =>
      _LocationAutoCompletePageState();
}

class _LocationAutoCompletePageState extends State<LocationAutoCompletePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _pageInitialized = false;
  FocusNode _searchTextFocusNode = FocusNode();
  TextEditingController _searchTextController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _reachedend = false;
  bool _loading = false;
  String? currentSearchString;
  final TextEditingController _autocompleteInputController =
      TextEditingController();
  List<String>? _searchResultCities;

  @override
  didChangeDependencies() {
    if (!_pageInitialized) {
      _autocompleteInputController.addListener(() {
        setState(() {
          if (_autocompleteInputController.text.length == 0) {
            _searchResultCities = [];
          } else {
            _searchResultCities = [];
            int i = 0;
            GlobalConstants.listOfCities.forEach((String city) {
              if (i < 8) {
                if (city.toLowerCase().contains(
                    _autocompleteInputController.text.toLowerCase())) {
                  _searchResultCities!.add(city);
                  i++;
                }
              }
            });
          }
        });
      });
      _pageInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  dispose() {
    _searchTextFocusNode.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              color: GlobalConstants.backgroundColor.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 16),
                  Container(
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back_ios_new),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: TextFormField(
                        textInputAction: TextInputAction.search,
                        focusNode: _searchTextFocusNode,
                        controller: _autocompleteInputController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.onInverseSurface,
                          enabledBorder: InputBorder.none,

                          contentPadding: const EdgeInsets.only(
                            top: 0,
                            bottom: 0,
                            right: 5,
                            left: 15.0,
                          ),
                          suffixIcon: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: const Icon(
                                Icons.clear,
                              ),
                              onTap: () {
                                _autocompleteInputController.text = "";
                                setState(() {
                                  _searchResultCities = [];
                                });
                              }),
                          prefixIcon: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: const Icon(
                              Icons.search,
                            ),
                          ),

                          hintText: 'Eg. Bangalore',
                          labelText:
                              // ((widget.enableCurrentLocation != null) &&
                              //         widget.enableCurrentLocation!)
                              //     ?
                              'Search for cities',
                          // : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: (_searchResultCities ?? []).map((city) {
                          return GestureDetector(
                            child: Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Icon(Icons.location_on),
                                  ),
                                  Expanded(
                                    child: Text(
                                      city,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop(city);
                            },
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
