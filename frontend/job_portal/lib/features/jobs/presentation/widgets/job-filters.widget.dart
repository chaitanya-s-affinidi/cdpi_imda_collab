import 'package:job_portal/features/design_system/af-text-form-field-wrapper.widget.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JobFiltersWidget extends StatefulWidget {
  const JobFiltersWidget({super.key});

  @override
  State<JobFiltersWidget> createState() => _JobFiltersWidgetState();
}

class _JobFiltersWidgetState extends State<JobFiltersWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int? _expandedIndex;
  bool _pageInitialized = false;
  bool _searchInProgressFlag = false;
  @override
  void didChangeDependencies() {
    if (!_pageInitialized) {
      setState(() {
        _expandedIndex = 0;
      });
      _pageInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: GlobalConstants.backgroundColor,
        title: const Text(
          "Search for jobs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (index, expanded) {
                  setState(() {
                    _expandedIndex = index;
                  });
                },
                children: <ExpansionPanel>[
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _expandedIndex == 0,
                    headerBuilder: (BuildContext context, bool expanded) {
                      return const ListTile(
                        isThreeLine: true,
                        dense: true,
                        leading: Icon(
                          Icons.business_center,
                          size: 40,
                        ),
                        title: Text("Skills"),
                        subtitle: Text(
                          "UX Design, React Native",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          AFTextFormFieldWrapperWidget(),
                        ],
                      ),
                    ),
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _expandedIndex == 1,
                    headerBuilder: (BuildContext context, bool expanded) {
                      return const ListTile(
                        isThreeLine: true,
                        dense: true,
                        leading: Icon(
                          Icons.location_city,
                          size: 40,
                        ),
                        title: Text("Location"),
                        subtitle: Text(
                          "Bengaluru",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          AFTextFormFieldWrapperWidget(),
                        ],
                      ),
                    ),
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _expandedIndex == 2,
                    headerBuilder: (BuildContext context, bool expanded) {
                      return const ListTile(
                        isThreeLine: true,
                        dense: true,
                        leading: Icon(
                          Icons.light_mode,
                          size: 40,
                        ),
                        title: Text("Experience"),
                        subtitle: Text(
                          "10 years",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          AFTextFormFieldWrapperWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            child: FilledButton(
              onPressed: () {
                if (!_searchInProgressFlag) {
                  // setState(() {
                  //   _searchInProgressFlag = true;
                  // });
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: GlobalConstants.backgroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  side: BorderSide.none,
                ),
                fixedSize: const Size.fromWidth(320),
              ),
              child: _searchInProgressFlag
                  ? const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30,
                    )
                  : const Text(
                      "SEARCH",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
