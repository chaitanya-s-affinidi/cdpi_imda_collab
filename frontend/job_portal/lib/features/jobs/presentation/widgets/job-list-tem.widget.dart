import 'package:flutter/material.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/jobs/domain/entities/job.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class JobListItemWidget extends HookWidget {
  final Job job;
  const JobListItemWidget({super.key, required this.job});

  Widget? _buildCompanyImage() {
    Widget? childWidget;
    if (job.companyLogo != null) {
      childWidget = Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(
              job!.companyLogo!,
            ),
          ),
        ),
      );
    } else {
      childWidget = Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              40,
            ),
          ),
          border: Border.all(
            width: 0.2,
            color: Colors.black26,
          ),
        ),
        child: const Icon(
          Icons.account_circle_sharp,
          size: 40,
          color: Colors.black54,
        ),
      );
    }
    return childWidget;
    // Container(
    //   height: 50,
    //   width: 50,
    //   child: childWidget,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DecoratedTextWidget(
                    content: job!.role,
                    overflowEllipsisFlag: true,
                    maxLines: 1,
                    height: 0.8,
                  ),
                  // (job!.fulfillmentCategory != null)
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: (job!.fulfillmentCategory ?? [])
                  //             .asMap()
                  //             .map((int index,
                  //                 JobFulfillmentCategory fulfillmentCategory) {
                  //               return MapEntry(
                  //                 index,
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       (fulfillmentCategory.type ?? '')
                  //                           .toLowerCase(),
                  //                       style: const TextStyle(
                  //                         fontSize: 12,
                  //                         color: Colors.black54,
                  //                       ),
                  //                     ),
                  //                     (index !=
                  //                             (job!.fulfillmentCategory!
                  //                                     .length -
                  //                                 1))
                  //                         ? Container(
                  //                             margin:
                  //                                 const EdgeInsets.symmetric(
                  //                               horizontal: 6,
                  //                             ),
                  //                             child: Container(
                  //                               height: 4,
                  //                               width: 4,
                  //                               decoration: const BoxDecoration(
                  //                                 borderRadius:
                  //                                     BorderRadius.all(
                  //                                   Radius.circular(4),
                  //                                 ),
                  //                                 color: Colors.black54,
                  //                               ),
                  //                             ),
                  //                           )
                  //                         : Container(),
                  //                   ],
                  //                 ),
                  //               );
                  //             })
                  //             .values
                  //             .toList())
                  //     : DecoratedTextWidget(
                  //         content: job!.description,
                  //         fontSize: 10,
                  //         // height: 0.8,
                  //         overflowEllipsisFlag: true,
                  //         maxLines: 1,
                  //       ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.bookmark_add_outlined,
            ),
          ],
        ),
        ListTile(
          leading: _buildCompanyImage(),
          dense: true,
          title: Text(job.company ?? ''),
          subtitle: Text(
            "${job.city ?? ""}, ${job.state ?? ""}",
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }
}
