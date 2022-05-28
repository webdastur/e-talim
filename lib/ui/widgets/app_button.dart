import 'package:e_talim/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.child,
    this.color,
    this.hasBorder = true,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side:
              hasBorder ? const BorderSide(color: ColorName.borderColor) : null,
          primary: color ?? ColorName.buttonColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
