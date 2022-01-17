import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color),
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            label: const Text("Gautam Sheta"),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      );
  }
}