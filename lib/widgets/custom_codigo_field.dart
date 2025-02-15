import 'package:flutter/material.dart';

class CustomCodigoField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color textColor;

  const CustomCodigoField({
    Key? key,
    this.controller,
    this.initialValue,
    this.onSaved,
    this.validator,
    required this.textColor,
  }) : super(key: key);

  @override
  _CustomCodigoFieldState createState() => _CustomCodigoFieldState();
}

class _CustomCodigoFieldState extends State<CustomCodigoField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(Icons.person, color: widget.textColor), // Prefix icon for the code
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: const OutlineInputBorder(),
        hintText: 'Digite seu código de acesso',
        hintStyle: TextStyle(color: widget.textColor),
      ),
    );
  }
}
