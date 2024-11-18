// import 'package:flutter/material.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// class DateTimePickerWidget extends StatefulWidget {
//   final GlobalKey<FormState>? formKey;
//   final DateTime? model;
//   final String? label;
//   final DateTime? minDate;
//   final DateTime? maxDate;
//   final bool? isRequired;
//   final bool? hideLabel;
//   final bool? showErrors;
//   final Function(DateTime) modelchanged;

//   const DateTimePickerWidget({
//     super.key,
//     required this.formKey,
//     required this.model,
//     this.label,
//     required this.minDate,
//     required this.maxDate,
//     this.isRequired,
//     required this.showErrors,
//     required this.modelchanged,
//     this.hideLabel,
//   });

//   @override
//   State<DateTimePickerWidget> createState() {
//     return DateTimePickerWidgetState(
//         // customdatetime: model,
//         // datetimemin: minDate,
//         // datetimemax: maxDate,
//         );
//   }
// }

// class DateTimePickerWidgetState extends State<DateTimePickerWidget> {
//   bool _pageInitialized = false;
//   FocusNode _datetimeFocusNode = FocusNode();
//   String? _dateTimeStringToTextField;
//   // bool _bottomSheetOpenedFlag = false;
//   @override
//   didChangeDependencies() {
//     if (!_pageInitialized) {
//       // _bottomSheetOpenedFlag = false;
//       if (widget.model != null) {
//         setState(() {
//           _dateTimeStringToTextField = HelperService()
//               .longHumanReadableStringFromDate(
//                   date: widget.model!.millisecondsSinceEpoch);
//         });
//       }

//       _pageInitialized = true;
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   didUpdateWidget(DateTimePickerWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   dispose() {
//     _datetimeFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AFTextFormFieldWrapperWidget(
//       focusNode: _datetimeFocusNode,
//       textInputAction: TextInputAction.done,
//       value: _dateTimeStringToTextField,
//       hintText: "Enter a date",
//       // alignLabelWithHint: true,
//       labelText: (((widget.hideLabel == null) || !widget.hideLabel!) &&
//               (widget.label != null))
//           ? (widget.label! +
//               (((widget.isRequired != null) && widget.isRequired!) ? '*' : ''))
//           : "",
//       // labelStyle: const TextStyle(
//       //   fontWeight: FontWeight.bold,
//       // ),
//       suffixIcon: const Icon(
//         Icons.calendar_today_outlined,
//       ),
//       showCursor: false,
//       readOnly: true,
//       // initialValue: widget.model != null) ?? "",
//       autovalidateMode: ((widget.showErrors != null) && widget.showErrors!)
//           ? AutovalidateMode.always
//           : AutovalidateMode.disabled,
//       validator: (String? value) {
//         if (((value == null) || (value == "")) &&
//             (widget.isRequired != null) &&
//             widget.isRequired!) {
//           debugPrint("value is null and widget.isRequired");
//           return widget.label! + " required";
//         } else {
//           if (widget.model != null) {
//             if (widget.model is DateTime) {
//               DateTime? datetimemin;
//               DateTime? datetimemax;
//               if (widget.minDate == null) {
//                 datetimemin = DateTime.now();
//               } else {
//                 datetimemin = widget.minDate;
//               }
//               if (widget.maxDate == null) {
//                 datetimemax = (DateTime.now()).add(const Duration(days: 180));
//               } else {
//                 datetimemax = widget.maxDate;
//               }

//               if (widget.model!.millisecondsSinceEpoch <
//                   datetimemin!.millisecondsSinceEpoch) {
//                 return ((widget.label ?? "") +
//                     " cannot be before " +
//                     HelperService().longHumanReadableStringFromDate(
//                         date: datetimemin.millisecondsSinceEpoch));
//               } else if (widget.model!.millisecondsSinceEpoch >
//                   datetimemax!.millisecondsSinceEpoch) {
//                 return (widget.label ?? "") +
//                     " cannot be after " +
//                     HelperService().longHumanReadableStringFromDate(
//                         date: widget.maxDate!.millisecondsSinceEpoch);
//               }
//             } else {
//               return "Invalid Date";
//             }
//           }
//         }
//         return null;
//       },

//       onTap: () {
//         debugPrint("datetime onClick called");
//         // if (_datetimeFocusNode.hasFocus) {
//         // if (!_bottomSheetOpenedFlag) {
//         //   _bottomSheetOpenedFlag = true;
//         DatePicker.showDateTimePicker(context, showTitleActions: true,
//             onChanged: (date) {
//           // _bottomSheetOpenedFlag = false;

//           // print('change $date in time zone ' +
//           //     date.timeZoneOffset.inHours.toString());
//         }, onConfirm: (date) {
//           // _bottomSheetOpenedFlag = false;
//           widget.modelchanged(date);
//           // Future.delayed(Duration(milliseconds: 500)).then((_) {
//           // if (_dateTimeStringController != null) {
//           setState(() {
//             _dateTimeStringToTextField = HelperService()
//                 .longHumanReadableStringFromDate(
//                     date: date.millisecondsSinceEpoch);
//           });
//           _datetimeFocusNode.unfocus();
//           // }
//           // });
//         }, onCancel: () {
//           // _bottomSheetOpenedFlag = false;
//           // Future.delayed(Duration(milliseconds: 500)).then((_) {
//           if (_datetimeFocusNode != null) {
//             _datetimeFocusNode.unfocus();
//           }
//           // });
//         }, currentTime: DateTime.now());
//         // }
//       },
//     );
//   }
// }
