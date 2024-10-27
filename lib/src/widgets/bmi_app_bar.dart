import 'package:flutter/material.dart';

class BmiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BmiAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('BMI Calculator'),
      centerTitle: true,
      elevation: 0.65,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
