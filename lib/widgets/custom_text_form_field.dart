import 'package:flutter/material.dart';
import '../config/size_config.dart';

class CustomTextField extends StatelessWidget {
  @required
  final TextEditingController? textEditingController;
  final String? hintText;
  final Icon? suffixIcon;
  final bool obsecure;
  final bool? isPassword;
  final Function()? showPassword;
  final String? Function(String?)? validate;

  CustomTextField(
      {this.textEditingController,
      this.hintText,
      this.suffixIcon,
      this.obsecure = false,
      this.isPassword = false,
      this.showPassword,
      this.validate});

  @override
  Widget build(BuildContext context) {
    final size = Ssize(context);
    return TextFormField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.top,
      validator: validate,
      obscureText: obsecure,
      decoration: InputDecoration(
        isDense: true,
        focusColor: Colors.grey,
        suffixIcon: (isPassword != null && showPassword != null)
            ? InkWell(
                onTap: showPassword!,
                child: obsecure
                    ? Icon(
                        Icons.visibility,
                        size: size.getFs(18),
                        color: Colors.grey,
                      )
                    : Icon(
                        Icons.visibility_off,
                        size: size.getFs(18),
                        color: Colors.grey,
                      ),
              )
            : suffixIcon,
        hintText: '$hintText',
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.getFs(10)),
          borderSide: BorderSide(
            color: Color(0XFF223943),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.getFs(10)),
          borderSide: BorderSide(
            color: Color(0XFF223943),
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.getFs(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.getFs(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
