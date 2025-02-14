import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

/// A custom tab bar widget with customizable appearance.
class MTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default constructor for the MTabBar.
  ///
  /// Parameters:
  ///   - tabs: List of widgets representing the tabs.
  const MTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? MColors.black : MColors.white, // Background color of the tab bar
      child: TabBar(
        tabs: tabs, // List of tabs
        isScrollable: true, // Enable scrollable tabs
        indicatorColor: MColors.primary, // Color of the tab indicator
        labelColor: dark ? MColors.white : MColors.primary, // Color of the selected tab label
        unselectedLabelColor: MColors.darkGrey, // Color of unselected tab labels
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight()); // Preferred size of the tab bar
}