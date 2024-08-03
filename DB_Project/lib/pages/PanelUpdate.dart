import 'package:flutter/material.dart';
import '../components/ProductFields.dart';
import 'package:db_project/Services/User.dart';
import 'package:db_project/Services/API/UserFunctions.dart';

class PanelUpdate extends StatefulWidget {
  const PanelUpdate({super.key});

  @override
  State<StatefulWidget> createState() => PanelUpdateState();
}

class PanelUpdateState extends State<PanelUpdate>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  final _formKey = GlobalKey<FormState>();
  String idValue = "";
  String usernameValue = "";
  String passwordValue = "";
  String emailValue = "";

  idOnSaved(dynamic value) {
    idValue = value;
  }

  usernameOnSaved(dynamic value) {
    usernameValue = value;
  }

  passwordOnSaved(dynamic value) {
    passwordValue = value;
  }

  emailOnSaved(dynamic value) {
    emailValue = value;
  }

  void updateUser(User user) {
    UserFunctions().updateUser(user.id ?? 0, user);
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
                        tabs: const [Tab(text: "Update")]),
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
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.2)),
                                FormContainer(
                                  formKey: _formKey,
                                  idOnSaved: idOnSaved,
                                  usernameOnSaved: usernameOnSaved,
                                  passwordOnSaved: passwordOnSaved,
                                  emailOnSaved: emailOnSaved,
                                  idbool: true,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.05)),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      updateUser(User(
                                          username: usernameValue,
                                          id: int.parse(idValue),
                                          password: passwordValue));
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    width: size.width * 0.12,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: Color(0xfffe7c39),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: .3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
