import 'package:flutter/material.dart';

//Using Material UI Design
// class CustomTextField extends StatefulWidget {
//   final String? hintText;
//   final IconData? prefixIcon;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmitted;
//   final FormFieldValidator<String>? validator;
//   final TextEditingController? textEditingController;
//   final TextInputType? keyboardType;
//
//   const CustomTextField({
//     Key? key,
//     this.hintText,
//     this.prefixIcon,
//     this.onChanged,
//     this.onSubmitted,
//     this.validator,
//     this.textEditingController,
//     this.keyboardType,
//   }) : super(key: key);
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   late FocusNode _focusNode;
//   String? _errorText;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _focusNode.addListener(_validateField);
//   }
//
//   @override
//   void dispose() {
//     _focusNode.removeListener(_validateField);
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   void _validateField() {
//     setState(() {
//       if (_focusNode.hasFocus) {
//         // If the field has focus, no error should be shown
//         _errorText = null;
//       } else {
//         // If the field doesn't have focus, show error only if text is empty
//         _errorText = widget.validator != null &&
//                 widget.textEditingController!.text.isEmpty
//             ? widget.validator!(widget.textEditingController!.text)
//             : null;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.textEditingController,
//       keyboardType: widget.keyboardType,
//       onChanged: widget.onChanged,
//       onFieldSubmitted: widget.onSubmitted,
//       focusNode: _focusNode,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
//         errorText: _errorText,
//       ),
//     );
//   }
// }
class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool readOnly; // Add this line

  const CustomTextField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.textEditingController,
    this.keyboardType,
    this.readOnly = false, // Default value is false
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_validateField);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_validateField);
    _focusNode.dispose();
    super.dispose();
  }

  void _validateField() {
    setState(() {
      if (_focusNode.hasFocus) {
        // If the field has focus, no error should be shown
        _errorText = null;
      } else {
        // If the field doesn't have focus, show error only if text is empty
        _errorText = widget.validator != null &&
            widget.textEditingController!.text.isEmpty
            ? widget.validator!(widget.textEditingController!.text)
            : null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      focusNode: _focusNode,
      readOnly: widget.readOnly, // Set read-only property
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        errorText: _errorText,
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;

  const CustomPasswordTextField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.textEditingController,
    this.keyboardType,
  }) : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_validateField);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_validateField);
    _focusNode.dispose();
    super.dispose();
  }

  void _validateField() {
    setState(() {
      if (_focusNode.hasFocus) {
        // If the field has focus, no error should be shown
        _errorText = null;
      } else {
        // If the field doesn't have focus, show error only if text is empty
        _errorText = widget.validator != null &&
                widget.textEditingController!.text.isEmpty
            ? widget.validator!(widget.textEditingController!.text)
            : null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: (value) {
        // Validate on focus change
        if (_focusNode.hasFocus) {
          return null; // Return null when focused
        }
        return _errorText; // Return previously set error text when not focused
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        errorText: _errorText,
      ),
    );
  }
}

class CustomDropdownFormField extends FormField<String> {
  final List<String> items;
  final double dropdownWidth;
  final double dropdownHeight;

  CustomDropdownFormField({
    Key? key,
    required String value,
    required this.items,
    this.dropdownWidth = 200.0, // default width
    this.dropdownHeight = 18.0, // default height
    ValueChanged<String>? onChanged,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          initialValue: value,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<String> field) {
            return InputDecorator(
              decoration: InputDecoration(
                errorText: field.errorText,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: Container(
                  width: dropdownWidth,
                  height: dropdownHeight,
                  child: DropdownButton<String>(
                    value: field.value,
                    onChanged: onChanged != null
                        ? (String? newValue) {
                            field.didChange(newValue);
                            if (onChanged != null) {
                              onChanged(newValue!);
                            }
                          }
                        : null,
                    items: items.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        );
}
