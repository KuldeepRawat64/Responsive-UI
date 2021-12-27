import 'package:flutter/material.dart';
import 'package:responsive_ui/constants.dart';
import 'package:responsive_ui/panel_left/circle_chart.dart';
import 'package:responsive_ui/responsive_layout.dart';

import 'curved_chart.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Todo> _todo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Marketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                    color: Constants.purpleDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    )),
              ),
            ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18% of Prodcuts Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                            label: Text(
                          "4500",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
                //Graph 1
                const LineChartSample2(),
                //Graph 2
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      right: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      bottom: Constants.kPadding),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: List.generate(
                        _todo.length,
                        (index) => CheckboxListTile(
                            title: Text(
                              _todo[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: _todo[index].enable,
                            onChanged: (newValue) {
                              setState(() {
                                _todo[index].enable = newValue ?? true;
                              });
                            }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
