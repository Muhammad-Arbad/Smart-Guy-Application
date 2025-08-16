import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_guy/constants/consts.dart';
import 'package:smart_guy/widgets/image_icon.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String label;
  final String imagePathPrefix;
  final bool suffixIconVisible;
  final bool obscureText;
  final Color color;
  final Color iconColor;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixIconPressed;
  final bool isOptional;
  final bool isNumber;
  final bool isEmail;
  final bool isReadOnly;
  final bool autoFocus;
  final TextInputType? textInputType;
  final String? Function(String?)? customValidator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    this.title = '',
    this.imagePathPrefix = '',
    this.suffixIconVisible = false,
    this.obscureText = false,
    this.color = const Color(0xFFF7FAFC),
    this.iconColor = const Color(0xFF718096),
    this.onChanged,
    this.onSuffixIconPressed,
    this.isOptional = false,
    this.isNumber = false,
    this.isEmail = false,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.textInputType,
    this.customValidator,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final FocusNode _focusNode = FocusNode();
  final String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final String phoneNumberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _validateInput(String? value) {
    if (widget.customValidator != null) {
      return widget.customValidator!(value);
    }

    if (widget.isOptional) return null;

    if (value == null || value.isEmpty) {
      return "${widget.label} is required";
    }

    if (widget.isEmail) {
      final regex = RegExp(emailPattern);
      if (!regex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
    }

    if (widget.isNumber) {
      final regex = RegExp(phoneNumberPattern);
      if (!regex.hasMatch(value)) {
        return 'Enter a valid number';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty) ...[
            Text(
              widget.title,
              style: CustomTextStyles.greytextfont14,
            ),
            const SizedBox(height: 6.0),
          ],
          TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            cursorColor: CustomAppColors.primaryColor,
            cursorErrorColor: Colors.red,
            focusNode: _focusNode,
            readOnly: widget.isReadOnly,
            autofocus: widget.autoFocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validateInput,
            keyboardType: widget.textInputType ??
                (widget.isNumber ? TextInputType.number : TextInputType.text),
            inputFormatters: widget.isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            decoration: InputDecoration(
              label: Text(
                widget.label,
                style: CustomTextStyles.textlfieldlabeltext,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 14.0,
              ),
              filled: true,
              fillColor: widget.color,
              focusColor: widget.color,
              hoverColor: widget.color,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: CustomAppColors.grayBorderClr),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: CustomAppColors.grayBorderClr),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
              prefixIcon: widget.imagePathPrefix.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: IconImage(
                    path: widget.imagePathPrefix,
                    color: widget.iconColor,
                  ),
                  onPressed: null,
                ),
              )
                  : null,
              suffixIcon: widget.suffixIconVisible
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: IconImage(
                    path: widget.obscureText
                        ? "assets/images/eye_hide.png"
                        : "assets/images/eye.png",
                    color: widget.iconColor,
                  ),
                  onPressed: widget.onSuffixIconPressed,
                ),
              )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}