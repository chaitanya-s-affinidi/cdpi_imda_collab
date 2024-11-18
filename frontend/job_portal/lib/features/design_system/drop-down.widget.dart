import 'decorated-text.widget.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<DropDownListItem> dropDownList;
  final String? label;
  final String? value;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final GlobalKey<FormState> formKey;
  DropDownWidget({
    required this.dropDownList,
    required this.value,
    this.autovalidateMode,
    this.validator,
    this.onChanged,
    this.onSaved,
    required this.formKey,
    this.label,
  });
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class DropDownListItem {
  final String? value;
  final String text;
  DropDownListItem({
    required this.value,
    required this.text,
  });
}

class _DropDownWidgetState extends State<DropDownWidget> {
  bool _pageInitialized = false;
  // List<Widget>? _widgetList;
  // ScrollController? _scrollController;
  @override
  void didChangeDependencies() {
    if (!_pageInitialized) {
      _pageInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  dispose() {
    // _scrollController!.dispose();

    super.dispose();
  }

  // showCupertinoPicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: MediaQuery.of(context).viewInsets,
  //         child: Column(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.only(
  //                 left: 10.0,
  //                 right: 10.0,
  //                 top: 4.0,
  //                 bottom: 20.0,
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   TextButton(
  //                     child: DecoratedTextWidget(
  //                       content: "CANCEL",
  //                       fontSize: 12,
  //                       bold: true,
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   ),
  //                   ActionChip(
  //                     label: Text("DONE"),
  //                     onPressed: () {
  //                       Navigator.of(context).pop(
  //                           widget.dropDownList[_selectedDropdownItem ?? 0].value);
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //             const Divider(),
  //             Expanded(
  //               child: CupertinoPicker(
  //                 scrollController:
  //                     _scrollController as FixedExtentScrollController?,
  //                 itemExtent: 40,
  //                 onSelectedItemChanged: (index) {
  //                   debugPrint("onSelectedItemChanged: " + index.toString());
  //                   _selectedDropdownItem = index;
  //                 },
  //                 children: _widgetList ?? [],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   ).then((dynamic resp) {
  //     if (resp != null) {
  //       debugPrint("sending response from DropDownWidget: " + (resp as String));
  //       widget.onChanged(resp);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return (widget.dropDownList.length > 0)
        ?
        // Form(
        //     key: widget.formKey,
        //     child:
        Container(
            padding: const EdgeInsets.all(6.0),
            child: DropdownButtonFormField(
              value: widget.value ?? widget.dropDownList[0].value,
              isDense: true,
              alignment: Alignment.centerLeft,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.onInverseSurface,
                focusedBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  gapPadding: 0,
                ),
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  gapPadding: 0,
                ),
                errorBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  gapPadding: 0,
                ),
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 6,
                  right: 6,
                  bottom: 6,
                ),
                labelText: widget.label ?? "",
              ),
              autovalidateMode: widget.autovalidateMode,
              validator: widget.validator,
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((DropDownListItem listItem) {
                // debugPrint("listItem.text: " + listItem.text);
                return DropdownMenuItem<String>(
                  value: listItem.value,
                  child: DecoratedTextWidget(
                    content: listItem.text,
                    textAlign: TextAlign.left,
                    // fontSize: 12,
                    // height: 0.6,
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if ((value != null) && (widget.onChanged != null)) {
                  // setState(() {
                  //   _selectedDropdownItem = value;
                  // });

                  widget.onChanged!(value);
                }
              },
              onSaved: (String? value) {
                if ((value != null) && (widget.onSaved != null)) {
                  // setState(() {
                  //   _selectedDropdownItem = value;
                  // });
                  widget.onSaved!(value);
                }
              },
            ),
            // ),
          )
        : Container();

    // TextButton(
    //     child: Row(
    //       children: <Widget>[
    //         DecoratedTextWidget(
    //           content: widget.dropDownList[_selectedDropdownItem ?? 0].text,
    //           fontSize: 12,
    //           bold: true,
    //         ),
    //         const Icon(
    //           Icons.edit_outlined,
    //         ),
    //       ],
    //     ),
    //     onPressed: showCupertinoPicker,
    //   )
    // : Container();
  }
}
