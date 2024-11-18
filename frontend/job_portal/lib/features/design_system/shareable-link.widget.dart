// import 'package:flutter/material.dart';
// import 'package:job_portal/features/design_system/decorated-text.widget.dart';

// class ShareableLinkWidget extends StatefulWidget {
//   final String link;
//   final String? title;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   ShareableLinkWidget({
//     required this.scaffoldKey,
//     required this.link,
//     this.title,
//   });
//   @override
//   _ShareableLinkWidgetState createState() => _ShareableLinkWidgetState();
// }

// class _ShareableLinkWidgetState extends State<ShareableLinkWidget> {
//   final TextEditingController _linkController = TextEditingController();

//   @override
//   void initState() {
//     _linkController.text = widget.link;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: <Widget>[
//         (widget.title != null) ? Text(widget.title!) : Container(),
//         Row(
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(6),
//                 child: TextFormField(
//                   textInputAction: TextInputAction.done,
//                   // key: _referralFormKey,
//                   // decoration: const InputDecoration(
//                   //   border: InputBorder.none,
//                   //   contentPadding:
//                   //     const EdgeInsets.only(left: 12, bottom: 6, right: 12),
//                   // ),
//                   readOnly: true,
//                   controller: _linkController,
//                 ),
//               ),
//             ),
//             Container(
//               child: TextButton(
//                 child: DecoratedTextWidget(
//                   content: "copy",
//                   textColor: Colors.blue.withOpacity(0.1),
//                 ),
//                 onPressed: () {
//                   FlutterClipboard.copy(widget.link).then((result) {
//                     return MessageBoard.newmessage(
//                       context: context,
//                       body: "Copied !",
//                     );
//                   });
//                 },
//               ),
//             ),
//           ],
//         )
//       ],
//     ));
//   }
// }
