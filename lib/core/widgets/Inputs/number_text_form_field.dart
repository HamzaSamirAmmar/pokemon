import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class NumberTextFormField extends StatelessWidget {
  final TextEditingController numberController;
  const NumberTextFormField({
    super.key,
    required this.numberController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: 'Mobile No',
      controller: numberController,
      keyboardType: TextInputType.number,
      validator: (number) {
        if (number == null || number.isEmpty) {
          return "Mobile Number is required";
        }
        if (int.tryParse(number) == null) {
          return "Please enter a valid mobile number";
        }
        if (!number.startsWith('07')) {
          return "Mobile number must start with 07";
        }
        if (number.length != 10) {
          return "Mobile number must be 10 digits";
        }
        return null;
      },
    );
  }
}
