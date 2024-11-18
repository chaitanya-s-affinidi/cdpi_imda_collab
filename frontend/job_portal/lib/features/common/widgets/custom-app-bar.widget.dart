import 'dart:io';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool showTrailingIcon;
  final VoidCallback? onTrailingIconPressed;

  const CustomAppBar({
    Key? key,
    required this.appBarTitle,
    this.showTrailingIcon = false,
    this.onTrailingIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
      centerTitle: true,
      leading: IconButton(
        icon: Platform.isIOS ? const Icon(Icons.arrow_back_ios) : const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        if (showTrailingIcon) ...{
          IconButton(
            onPressed: onTrailingIconPressed,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        }
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
