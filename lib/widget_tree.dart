import 'package:flutter/material.dart';
import 'package:responsive_ui/app_bar/app_bar_widget.dart';
import 'package:responsive_ui/drawer/drawer_page.dart';
import 'package:responsive_ui/panel_center/panel_center_page.dart';
import 'package:responsive_ui/panel_left/panel_left_page.dart';
import 'package:responsive_ui/panel_right/panel_right_page.dart';
import 'package:responsive_ui/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyWidthLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : const AppBarWidget(),
        preferredSize: const Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PanelCenterPage(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage())
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage())
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage())
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }
}
