import 'package:flutter/material.dart';
import '../Services/User.dart';
import 'package:db_project/Services/API/UserFunctions.dart';

class PanelHome extends StatefulWidget {
  const PanelHome({super.key});

  @override
  State<StatefulWidget> createState() => PanelHomeState();
}

class PanelHomeState extends State<PanelHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 1, vsync: this);
    UserFunctions().getUsers().then((List<User> allUsers) {
      setState(() {
        users = allUsers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTabController(
              length: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.675),
                    width: size.width * 0.15,
                    height: size.height * 0.08,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(fontSize: 16),
                        unselectedLabelStyle: const TextStyle(fontSize: 15),
                        indicator: const BoxDecoration(
                            color: Color(0xfffe7c39),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        controller: tabController,
                        tabs: const [Tab(text: "All Users")]),
                  ),
                  SizedBox(
                    width: size.width * 0.825,
                    height: size.height * 0.85,
                    child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: size.width * 0.01),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: users.length,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Text(users[index].id.toString()),
                                              Text(users[index].username),
                                              Text(users[index].password ?? ""),
                                              Text(users[index].email ?? ""),
                                            ],
                                          ))),
                                ),
                              ],
                            ), //services.getProducts()
                          )
                        ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
