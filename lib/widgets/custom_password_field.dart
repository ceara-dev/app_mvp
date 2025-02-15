import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color textColor;

  const CustomPasswordField({
    Key? key,
    this.controller,
    this.initialValue,
    this.onSaved,
    this.validator,
    required this.textColor,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      obscureText: _obSecure,
      validator: widget.validator,
      onSaved: widget.onSaved,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(Icons.lock, color: widget.textColor), // Prefix icon
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obSecure ? Icons.lock_outline : Icons.lock_open,
            color: widget.textColor,
          ),
          onPressed: () {
            setState(() {
              _obSecure = !_obSecure;  
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: const OutlineInputBorder(),
        hintText: 'Digite sua senha',
        hintStyle: TextStyle(color: widget.textColor),
      ),
    );
  }
}
