import 'package:flutter/material.dart';
import 'package:responsive_ui/constants.dart';
import 'package:responsive_ui/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtonInfo {
  String title;
  IconData icon;
  ButtonInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtonInfo> _buttonNames = [
  ButtonInfo(title: "Home", icon: Icons.home),
  ButtonInfo(title: "Setting", icon: Icons.settings),
  ButtonInfo(title: "Notifications", icon: Icons.notifications),
  ButtonInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonInfo(title: "Sales", icon: Icons.sell),
  ButtonInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonInfo(title: "Security", icon: Icons.verified_user),
  ButtonInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Constants.redDark.withOpacity(0.9),
                                Constants.orangeDark.withOpacity(0.9)
                              ]))
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
