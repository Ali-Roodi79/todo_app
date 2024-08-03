import 'package:flutter/material.dart';

class InputFieldArea extends StatefulWidget {
  final String hint;
  bool obscure;
  final IconData icon;
  final bool show;
  final onSaved;

  InputFieldArea(
      {super.key,
      required this.hint,
      required this.obscure,
      required this.icon,
      required this.show,
      this.onSaved});

  @override
  State<StatefulWidget> createState() => InputField();
}

class InputField extends State<InputFieldArea> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width > size.height) ? size.width * 0.3 : null,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border(
              right: BorderSide(width: 1, color: Colors.black87),
              left: BorderSide(width: 1, color: Colors.black87),
              bottom: BorderSide(width: 1, color: Colors.black87),
              top: BorderSide(width: 1, color: Colors.black87))),
      child: TextFormField(
        controller: controller,
        obscureText: widget.obscure,
        style: const TextStyle(color: Colors.black87),
        onSaved: widget.onSaved,
        onFieldSubmitted: (value){
          controller.clear();
        },
        decoration: InputDecoration(
            suffixIcon: (widget.show)
                ? IconButton(
                    color: Colors.black,
                    icon: Icon(widget.obscure
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.obscure = !widget.obscure;
                      });
                    })
                : null,
            icon: Icon(
              widget.icon,
              color: Colors.black54,
            ),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
            contentPadding:
                const EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 3)),
      ),
    );
  }
}
