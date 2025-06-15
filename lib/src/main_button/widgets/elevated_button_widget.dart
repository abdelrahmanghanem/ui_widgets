import 'package:flutter/material.dart';

import '../decoration/button_style_class.dart';
import '../functions/get_button_color.dart';
import 'circular_indicator_widget.dart';
import 'main_button.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ///  width  => default value is double.infinity
  final double? width;

  ///  maximum width  => default value is 370
  final double? maxWidth;

  ///  height  => default value is 44
  final double? height;

  /// padding => const EdgeInsets.all(12).
  final EdgeInsets? contentPadding;

  /// radius  => default value is 10
  final double? radius;

  /// A callback function that is triggered when the button is pressed.
  final void Function()? onPressed;

  final Color? backgroundColor;

  /// disableColor => default value is Colors.grey.shade300
  final Color? disableColor;

  /// isLoading => default value is false
  final bool? isLoading;

  /// showShadow => default value is false
  final bool? showShadow;

  /// borderColor => default value is Colors.transparent
  final Color? borderColor;

  /// smallSize => default value is false
  final bool? smallSize;

  /// isDisable => default value is false
  final bool? isDisable;

  /// opacity => default value is null

  final double? opacity;

  /// type => default value is MainButtonEnum.primary
  final MainButtonEnum? type;

  final Widget? child;

  /// labelColor => default value is Colors.white
  final Color? labelColor;

  const ElevatedButtonWidget({
    super.key,
    this.width,

    ///  maximum width  => default value is 370
    this.maxWidth,
    this.height,
    this.contentPadding,
    this.radius,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.labelColor,
    this.disableColor,
    this.isLoading,
    this.showShadow,
    this.isDisable,
    this.smallSize,
    this.borderColor,
    this.opacity,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final radiusValue = BorderRadius.all(Radius.circular(radius ?? 8));
    final typeValue = type ?? MainButtonEnum.primary;
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: radiusValue),
        shadows: !(showShadow ?? false)
            ? null
            : const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
      ),
      child: ElevatedButton(
        style: ButtonStyleClass(
          width: width ?? double.infinity,
          maxWidth: maxWidth ?? 370,
          height: height ?? 44,
          radius: radius ?? 8,
          labelColor: getTextColor(typeValue, context, color: labelColor),
          borderColor: getBorderColor(typeValue, context, color: borderColor),
          background: getBorderColor(
            typeValue,
            context,
            color: backgroundColor,
          ),
          context: context,
          smallSize: smallSize ?? false,
          opacity: opacity,
          contentPadding: contentPadding ?? const EdgeInsets.all(12),
          disableColor: disableColor ?? Colors.grey.shade100,
        ).apply,
        onPressed: (isLoading ?? false) || (isDisable ?? false)
            ? null
            : onPressed,
        child: (isLoading ?? false)
            ? SizedBox(
                width: (smallSize ?? false) ? 60 : width,
                height: (smallSize ?? false) ? 40 : height,
                child: CircularIndicatorWidget(
                  color: getLoadingColor(typeValue, context, color: labelColor),
                ),
              )
            : child,
      ),
    );
  }
}
