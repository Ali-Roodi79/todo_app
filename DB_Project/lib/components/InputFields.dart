import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFieldArea extends StatefulWidget {
  final String hint;
  bool obscure;
  final IconData icon;
  final bool show;
  final onSaved;

  InputFieldArea(
      {required this.hint, required this.obscure, required this.icon, required this.show, this.onSaved});

  @override
  State<StatefulWidget> createState() => InputField();
}
class InputField extends State<InputFieldArea>{
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width>size.height)?size.width*0.3:null,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.white54
          )
        )
      ),
      child: TextFormField(

        obscureText: widget.obscure,
        style: const TextStyle(
          color: Colors.white
        ),
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          suffixIcon: (widget.show)?IconButton(
            color: Colors.white,
              icon: Icon(widget.obscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  widget.obscure = !widget.obscure;
                });
              }):null,
          icon: Icon(
            widget.icon ,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.white70 , fontSize: 15),
          contentPadding: const EdgeInsets.only(
            top: 15 , right: 0 , bottom: 10 , left: 5
          )
        ),
      ),
    );
  }
}