import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    FocusScope.of(context).unfocus();
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefix: Icon(Icons.message),
          labelText: "Type a message",
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 5, color: Colors.black)),
          suffix: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.blue,
            tooltip: "Post message",
            onPressed: this.click,
          )),
    );
  }
}
