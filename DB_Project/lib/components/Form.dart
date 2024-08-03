import 'package:flutter/material.dart';
import 'package:db_project/components/InputFields.dart';

class FormContainer extends StatelessWidget {

  final formKey;
  final emailOnSaved;
  final passwordOnSaved;

  FormContainer({@required this.formKey, this.emailOnSaved, this.passwordOnSaved });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Form(
              key : formKey,
              child: Column(
                children: <Widget>[
                  InputFieldArea(
                    hint: "Username",
                    obscure: false,
                    icon: Icons.person_outline,
                    show: false,
                    onSaved: emailOnSaved,
                  ),
                  InputFieldArea(
                    hint: "password",
                    obscure: true,
                    icon: Icons.lock_open,
                    show: true,
                    onSaved : passwordOnSaved,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}