import 'package:flutter/material.dart';
import '../../../constants/utility/color_lists.dart';
import '../../../constants/utility/project_styles.dart';

class SquareButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Icon? icon;
  final ColorListsEnum selectedColor;

  const SquareButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThereIcon = icon != null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 6,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(
              begin: const Alignment(-0.95, 0.0),
              end: const Alignment(1.0, 0.0),
              colors: selectedColor.colorList,
              stops: const [0.0, 1.0],
            ),
            // borderRadius: BorderRadius.all(Radius.circular(12),

            // ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            icon ?? const SizedBox(),
            const SizedBox(height: 6),
            Text(
              title,
              style: isThereIcon
                  ? ProjectStyles().lightButtonTextStyle
                  : ProjectStyles().lightButtonTextStyleBig,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}

enum ColorListsEnum {
  //XXX: Sağlam enum örneği
  orange('orangeColors'),
  purple('purpleColors'),
  blue('blueColors'),
  green('greenColors'),
  yellow('yellowColors'),
  red('redColors'),
  pink('pinkColors');

  final String value;
  const ColorListsEnum(this.value);

  List<Color> get colorList {
    switch (this) {
      case ColorListsEnum.orange:
        return orangeColors;
      case ColorListsEnum.purple:
        return purpleColors;
      case ColorListsEnum.blue:
        return blueColors;
      case ColorListsEnum.green:
        return greenColors;
      case ColorListsEnum.yellow:
        return yellowColors;
      case ColorListsEnum.red:
        return redColors;
      case ColorListsEnum.pink:
        return pinkColors;
      default:
        return orangeColors;
    }
  }
}
