import 'package:flutter/material.dart';
import 'package:db_project/components/ProductInput.dart';

class FormContainer extends StatelessWidget {

  final formKey;
  final usernameOnSaved;
  final passwordOnSaved;
  final emailOnSaved;
  final idOnSaved;
  final idbool;
  final passwordbool;

  FormContainer({super.key, @required this.formKey, this.usernameOnSaved, this.passwordOnSaved, this.emailOnSaved, this.idOnSaved, this.idbool=false, this.passwordbool=false });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
            key : formKey,
            child: Column(
              children: <Widget>[
                idbool?InputFieldArea(
                  hint: "ID",
                  obscure: false,
                  icon: Icons.numbers,
                  show: false,
                  onSaved: idOnSaved,
                ):const Padding(padding: EdgeInsets.only(top: 0)),
                passwordbool?const Padding(padding: EdgeInsets.only(top: 0)):InputFieldArea(
                  hint: "User Name",
                  obscure: false,
                  icon: Icons.supervised_user_circle,
                  show: false,
                  onSaved: usernameOnSaved,
                ),
                passwordbool?const Padding(padding: EdgeInsets.only(top: 0)):InputFieldArea(
                  hint: "Password",
                  obscure: false,
                  icon: Icons.password,
                  show: true,
                  onSaved : passwordOnSaved,
                ),
                passwordbool?const Padding(padding: EdgeInsets.only(top: 0)):InputFieldArea(
                  hint: "Email",
                  obscure: false,
                  icon: Icons.email,
                  show: false,
                  onSaved: emailOnSaved,
                ),
              ],
            )
        )
      ],
    );
  }
}