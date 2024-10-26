import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const IconData _maleIcon = FontAwesomeIcons.mars;
const IconData _femaleIcon = FontAwesomeIcons.venus;

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.gender,
    this.onTap,
    this.selected = false,
  });
  final Gender gender;
  final void Function()? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final String title = gender.toString().split('.')[1].toUpperCase();
    final TextStyle titleStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.lerp(
                FontWeight.normal,
                FontWeight.bold,
                0.5,
              ),
            );
    final ButtonThemeData buttomTheme = Theme.of(context).buttonTheme;
    return Expanded(
      flex: 15,
      child: Card(
        margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
        color: selected
            ? buttomTheme.colorScheme!.surfaceContainer
            : buttomTheme.colorScheme!.surfaceContainer.withAlpha(160),
        child: MaterialButton(
          onPressed: selected ? null : onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          animationDuration: kThemeAnimationDuration,
          textColor: selected
              ? titleStyle.color
              : buttomTheme.colorScheme!.onSurface.withAlpha(100),
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(gender == Gender.male ? _maleIcon : _femaleIcon, size: 64),
              Text(
                title,
                textAlign: TextAlign.center,
                // style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// How a person identifies
enum Gender { male, female, none }
