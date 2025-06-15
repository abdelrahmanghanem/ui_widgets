import 'package:flutter/material.dart';

class SmartRefreshIndicator extends StatelessWidget {
  /// The widget to display as the main content when the [RefreshIndicator] is not active.
  final Widget child;

  /// The callback function that is triggered when the user performs a pull-to-refresh action.
  /// This function should handle the logic for refreshing the data.
  final Future<void> Function() onRefresh;

  const SmartRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // Function called when the user performs the pull-to-refresh gesture.
      onRefresh: onRefresh,

      // The color of the refresh indicator.
      color: Colors.white,

      // The main content widget that will be displayed when not in the refreshing state.
      child: child,
    );
  }
}
