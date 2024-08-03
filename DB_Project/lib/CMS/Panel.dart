import 'package:flutter/material.dart';
import 'package:db_project/pages/PanelAdd.dart';
import 'package:db_project/pages/PanelHome.dart';
import 'package:db_project/pages/PanelUpdate.dart';
import 'package:db_project/pages/PanelDelete.dart';

class Panel extends StatefulWidget {
  const Panel({super.key});

  // const Panel({super.key});
  @override
  State<StatefulWidget> createState() => PanelState();
}

int currentIndex = 0;

var body = [
  const PanelHome(),
  const PanelAdd(),
  const PanelUpdate(),
  const PanelDelete(),
];

var logo = [
  Icons.home,
  Icons.add_box,
  Icons.update,
  Icons.delete_forever,
];

var text = [
  "Home",
  "Add",
  "Update",
  "Delete",
];

class PanelState extends State<Panel> {
  // final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Color(0xffe8e5e5),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.05,
                  height: size.height * 0.85,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      bottom: size.height * 0.05,
                      left: size.width * 0.003),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: body.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () async {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Icon(
                                logo[index],
                                color: (currentIndex == index)
                                    ? const Color(0xfffd5905)
                                    : null,
                                size: 30,
                              ),
                              Text(
                                text[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: (currentIndex == index)
                                        ? const Color(0xfffd5905)
                                        : Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.width * 0.05)),
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            SizedBox(
              width: size.width * 0.9,
              height: size.height,
              child: body[currentIndex],
            )
          ],
        ),
      ),
    );
  }
}
