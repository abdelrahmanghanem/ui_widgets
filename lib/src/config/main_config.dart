import 'package:flutter/material.dart';

import 'button_config.dart';
import 'text_field_config.dart';
import 'widget_box_config.dart';

export 'button_config.dart';
export 'text_field_config.dart';
export 'widget_box_config.dart';

class WidgetsBoxConfigProvider extends InheritedWidget {
  final WidgetsBoxConfig config;

  const WidgetsBoxConfigProvider({
    super.key,
    required this.config,
    required super.child,
  });

  static WidgetsBoxConfig of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<WidgetsBoxConfigProvider>()
            ?.config ??
        const WidgetsBoxConfig(
          width: 370,
          height: 44,
          radius: 8,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          textFieldConfig: TextFieldConfig(cursorHeight: 18.0),
          buttonConfig: ButtonConfig(
            width: 370,
            height: 44,
            radius: 8,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        );
  }

  @override
  bool updateShouldNotify(WidgetsBoxConfigProvider oldWidget) {
    return config != oldWidget.config;
  }
}
